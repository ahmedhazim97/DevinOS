# UI/UX Pro Max Skill

Source: https://github.com/nextlevelbuilder/ui-ux-pro-max-skill
Author: NextLevelBuilder
License: MIT

## Requirements

This skill works fully **without Python** for AI-assisted design guidance. The main `SKILL.md` contains all core rules, styles, color palettes, typography, and UX guidelines.

However, to run the **CLI search scripts** referenced in the workflow (e.g. `scripts/search.py`), you must install Python:

- **Windows**: `winget install Python.Python.3.12`
- **macOS**: `brew install python3`
- **Linux**: `sudo apt install python3`

After installing Python, you can run commands like:

```bash
python3 scripts/search.py "SaaS analytics dashboard" --design-system -p "My Dashboard"
```

On Windows, use `python` instead of `python3`:

```powershell
python scripts/search.py "SaaS analytics dashboard" --design-system -p "My Dashboard"
```

## Files

- `SKILL.md` — Main design intelligence guide (read by Windsurf/Cascade)
- `scripts/` — Python search utilities for generating design systems
- `data/` — CSV datasets: colors, typography, styles, stacks, UX guidelines
- `LICENSE` — MIT license from the original author
