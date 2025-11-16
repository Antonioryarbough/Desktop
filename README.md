# Desktop Repository

This repository tracks desktop configurations, shortcuts, and personal files.

## Handling Uncommitted Changes

Since this is a Desktop folder with frequently changing files (shortcuts, configuration backups, etc.), uncommitted changes may be detected regularly.

### Check for Uncommitted Changes

Use the provided script to check for uncommitted changes:

**On Linux/Mac:**
```bash
bash check-uncommitted-changes.sh
```

**On Windows:**
```cmd
check-uncommitted-changes.bat
```

This will:
- Check for any uncommitted changes
- Display the list of modified files
- Provide options on how to proceed

### Proceed Despite Uncommitted Changes

If you need to proceed with an operation despite uncommitted changes, use the `--force` flag:

**On Linux/Mac:**
```bash
bash check-uncommitted-changes.sh --force
```

**On Windows:**
```cmd
check-uncommitted-changes.bat --force
```

This will acknowledge the uncommitted changes but allow operations to continue.

### Managing Changes

#### Option 1: Commit Changes
```bash
git add .
git commit -m "Update desktop configurations"
git push
```

#### Option 2: Stash Changes
```bash
git stash
# Do your work
git stash pop
```

#### Option 3: Discard Changes
```bash
git checkout -- .
```

## Files Ignored

The `.gitignore` file is configured to ignore:
- Temporary files (*.tmp, *.temp, *.bak)
- System files (Thumbs.db, desktop.ini)
- Windows shortcuts (*.lnk)
- Peace audio configuration backups (auto-generated)
- Build artifacts and logs

## Directory Structure

- `AI-ANTONIOS-INTELIGENCE/` - Main AI project files
- `Documents/` - Document storage and backups
- `shortcuts/` - Windows shortcut files
- `Peace.lnk` - Peace audio equalizer shortcut
- `desktop.ini` - Windows desktop configuration
