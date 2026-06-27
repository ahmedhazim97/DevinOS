#!/usr/bin/env python3
"""DevinOS Asset Validator - Automated quality checks for skills, rules, and assets."""

import argparse
import os
import re
import sys
from pathlib import Path

ASSET_CONFIG = {
    "skill": {
        "required": ["Description", "Purpose", "Trigger", "Context", "Workflow", "Examples", "Anti-patterns", "Verification", "References"],
        "min_words": 500, "max_words": 5000,
    },
    "rule": {
        "required": ["Principles", "Verification"],
        "min_words": 100, "max_words": 3000,
    },
    "workflow": {
        "required": ["Inputs", "Outputs", "Success Criteria", "Required Skills", "Step-by-Step"],
        "min_words": 300, "max_words": 4000,
    },
    "playbook": {
        "required": ["Scenario", "Severity", "Steps", "Escalation", "Communication Templates", "Post-Incident"],
        "min_words": 400, "max_words": 5000,
    },
    "template": {
        "required": ["README", "Tests", "Docker", "CI/CD", "Security Checklist"],
        "min_words": 200, "max_words": 10000,
    },
    "prompt": {
        "required": ["Category", "Purpose", "Context", "Role", "Output Format", "Constraints", "Examples"],
        "min_words": 100, "max_words": 3000,
    },
    "memory": {
        "required": ["Category", "What", "Why It Matters", "How to Apply", "Related Assets"],
        "min_words": 150, "max_words": 3000,
    },
}

PLACEHOLDERS = [r"TODO\b", r"FIXME\b", r"XXX\b", r"HACK\b", r"PLACEHOLDER", r"TBD\b", r"FILL IN", r"COMING SOON"]
SECRET_SIGNS = [r"password\s*=\s*['\"][^'\"]+['\"]", r"api_key\s*=\s*['\"][^'\"]+['\"]", r"secret\s*=\s*['\"][^'\"]+['\"]", r"token\s*=\s*['\"][^'\"]+['\"]", r"BEGIN (RSA |DSA |EC |OPENSSH )?PRIVATE KEY"]
DANGEROUS = [r"rm\s+-rf\s+/", r"DROP\s+DATABASE", r"DELETE\s+FROM\s+\w+\s+WHERE\s+1\s*=\s*1"]


def detect_type(filepath):
    p = str(filepath).lower()
    for key in ASSET_CONFIG:
        if f"/{key}s/" in p:
            return key
    return "skill"


def check_sections(content, asset_type):
    errors = []
    config = ASSET_CONFIG.get(asset_type, ASSET_CONFIG["skill"])
    content_lower = content.lower()
    for section in config["required"]:
        words = section.lower().split()
        found = any(
            re.search(rf"^#{{1,4}}\s+.*{re.escape(w)}.*", content_lower, re.MULTILINE)
            for w in words
        )
        if not found:
            errors.append(f"  MISSING: Section '{section}'")
    return errors


def check_word_count(content, asset_type):
    errors = []
    config = ASSET_CONFIG.get(asset_type, ASSET_CONFIG["skill"])
    words = len(content.split())
    if words < config["min_words"]:
        errors.append(f"  WORD COUNT: {words} (min: {config['min_words']})")
    elif words > config["max_words"]:
        print(f"  WARNING: Word count {words} exceeds recommended max {config['max_words']}")
    return errors, words


def check_placeholders(lines):
    errors = []
    for i, line in enumerate(lines, 1):
        for pattern in PLACEHOLDERS:
            if re.search(pattern, line, re.IGNORECASE):
                if "ticket" not in line.lower() and "issue" not in line.lower():
                    errors.append(f"  LINE {i}: Placeholder '{pattern}' without ticket ref")
                    break
    return errors


def check_secrets(lines):
    errors = []
    for i, line in enumerate(lines, 1):
        for pattern in SECRET_SIGNS:
            if re.search(pattern, line, re.IGNORECASE):
                if "example" not in line.lower():
                    errors.append(f"  LINE {i}: Possible hardcoded secret")
                break
    return errors


def check_dangerous(lines):
    errors = []
    in_block = False
    for i, line in enumerate(lines, 1):
        if line.strip().startswith("```"):
            in_block = not in_block
            continue
        if not in_block:
            continue
        for pattern in DANGEROUS:
            if re.search(pattern, line, re.IGNORECASE):
                prev = lines[i-2].lower() if i > 1 else ""
                if not any(w in prev for w in ["warning", "danger", "caution", "⚠️"]):
                    errors.append(f"  LINE {i}: Dangerous command without warning")
                break
    return errors


def check_markdown(content, lines):
    errors = []
    if content.count("```") % 2 != 0:
        errors.append("  UNCLOSED: Odd number of code block markers")
    for i, line in enumerate(lines, 1):
        if line.endswith(" ") or line.endswith("\t"):
            print(f"  WARNING: Line {i} has trailing whitespace")
    return errors


def check_links(content, filepath):
    errors = []
    pattern = r"\[([^\]]+)\]\(([^)]+)\)"
    root = filepath.parent
    while root.parent != root and not (root / ".agents").exists():
        root = root.parent
    for match in re.finditer(pattern, content):
        target = match.group(2)
        if target.startswith(("http://", "https://", "mailto:")):
            continue
        clean = target.split("#")[0]
        if target.startswith("/"):
            target_path = root / clean.lstrip("/")
        else:
            target_path = filepath.parent / clean
        if not target_path.exists():
            errors.append(f"  BROKEN LINK: '{target}' -> not found")
    return errors


def main():
    parser = argparse.ArgumentParser(description="Validate DevinOS assets")
    parser.add_argument("filepath", help="Path to asset markdown file")
    parser.add_argument("--type", choices=list(ASSET_CONFIG.keys()), help="Asset type override")
    parser.add_argument("--strict", action="store_true", help="Enable strict mode")
    args = parser.parse_args()

    filepath = Path(args.filepath)
    if not filepath.exists():
        print(f"ERROR: File not found: {filepath}")
        sys.exit(2)

    content = filepath.read_text(encoding="utf-8")
    lines = content.splitlines()
    asset_type = args.type or detect_type(filepath)

    print(f"\n{'='*60}")
    print(f"DevinOS Asset Validator")
    print(f"{'='*60}")
    print(f"File: {filepath}")
    print(f"Type: {asset_type}")
    print(f"{'-'*60}")

    all_errors = []

    # 1. Required Sections
    print("\n[Gate 2] Structure & Completeness")
    sec_errors = check_sections(content, asset_type)
    all_errors.extend(sec_errors)
    print(f"  Required sections: {len(ASSET_CONFIG[asset_type]['required'])} checked")
    if sec_errors:
        for e in sec_errors:
            print(e)
    else:
        print("  PASS: All required sections present")

    # 2. Word Count
    print("\n[Gate 3] Word Count")
    wc_errors, words = check_word_count(content, asset_type)
    all_errors.extend(wc_errors)
    print(f"  Total words: {words}")
    if wc_errors:
        for e in wc_errors:
            print(e)
    else:
        print("  PASS: Within acceptable range")

    # 3. Placeholders
    print("\n[Gate 6] Placeholders")
    ph_errors = check_placeholders(lines)
    all_errors.extend(ph_errors)
    if ph_errors:
        for e in ph_errors:
            print(e)
    else:
        print("  PASS: No unresolved placeholders")

    # 4. Secrets
    print("\n[Gate 6] Security Check")
    sec_errors = check_secrets(lines)
    all_errors.extend(sec_errors)
    if sec_errors:
        for e in sec_errors:
            print(e)
    else:
        print("  PASS: No hardcoded secrets detected")

    # 5. Dangerous Commands
    print("\n[Gate 6] Dangerous Commands")
    dang_errors = check_dangerous(lines)
    all_errors.extend(dang_errors)
    if dang_errors:
        for e in dang_errors:
            print(e)
    else:
        print("  PASS: No dangerous commands without warnings")

    # 6. Markdown
    print("\n[Gate 2] Markdown Formatting")
    md_errors = check_markdown(content, lines)
    all_errors.extend(md_errors)
    if md_errors:
        for e in md_errors:
            print(e)
    else:
        print("  PASS: Markdown formatting OK")

    # 7. Internal Links
    print("\n[Gate 2] Internal Links")
    link_errors = check_links(content, filepath)
    all_errors.extend(link_errors)
    if link_errors:
        for e in link_errors:
            print(e)
    else:
        print("  PASS: All internal links valid")

    # Summary
    print(f"\n{'='*60}")
    print(f"SUMMARY")
    print(f"{'='*60}")
    print(f"Total Errors: {len(all_errors)}")
    print(f"Total Warnings: shown above")

    if all_errors:
        print(f"\nRESULT: FAIL - Fix {len(all_errors)} error(s) before submission")
        print(f"\nDecision: Needs Revision")
        sys.exit(1)
    else:
        print(f"\nRESULT: PASS - Automated checks cleared")
        print(f"\nDecision: Ready for manual review (Gates 1, 3, 4, 5, 7)")
        print(f"\nNext: Run Quality Audit Skill for complete review")
        sys.exit(0)


if __name__ == "__main__":
    main()
