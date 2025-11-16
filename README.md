# Desktop Repository

This repository contains Desktop configuration files, Peace audio equalizer configurations, shortcuts, and AI-related projects.

## Repository Structure

- **AI-ANTONIOS-INTELIGENCE/** - AI-related projects and scripts
- **Documents/** - Document storage including Peace audio configurations
  - **Peace automatic configurations backup/** - Audio equalizer presets
  - **AI-ANTONIOS-INTELIGENCE/** - AI project files
- **shortcuts/** - Desktop shortcut files (.lnk)
- **Peace.lnk** - Shortcut to Peace audio equalizer
- **desktop.ini** - Windows desktop configuration

## Git Configuration

### Checking for Uncommitted Changes

This repository includes scripts to detect uncommitted changes before performing operations:

#### Linux/Mac/Git Bash
```bash
# Check for uncommitted changes
./check-uncommitted-changes.sh

# Proceed despite uncommitted changes
./check-uncommitted-changes.sh --force
```

#### Windows (Command Prompt)
```cmd
REM Check for uncommitted changes
check-uncommitted-changes.bat

REM Proceed despite uncommitted changes
check-uncommitted-changes.bat --force
```

### Exit Codes
- **0**: Clean working tree or forced to proceed
- **1**: Uncommitted changes detected (without --force)

### Ignored Files

The `.gitignore` file excludes:
- Temporary files (`*.tmp`, `*.bak`, `*.swp`)
- System files (`Thumbs.db`, `.DS_Store`)
- Build artifacts (`dist/`, `build/`, `node_modules/`)
- Environment files (`.env`, `.env.local`)
- IDE configuration files

## Usage Examples

### Before Pulling Updates
```bash
./check-uncommitted-changes.sh
git pull origin main
```

### Before Switching Branches
```bash
./check-uncommitted-changes.sh
git checkout other-branch
```

### CI/CD Integration
```yaml
# In GitHub Actions or other CI/CD
- name: Check for uncommitted changes
  run: ./check-uncommitted-changes.sh
```

## Troubleshooting

If you encounter "Uncommitted changes detected":

1. **Commit your changes:**
   ```bash
   git add .
   git commit -m "Your commit message"
   ```

2. **Stash your changes temporarily:**
   ```bash
   git stash
   # Do your operation
   git stash pop
   ```

3. **Discard your changes (WARNING: Cannot be undone):**
   ```bash
   git checkout -- .
   ```

4. **Force proceed (not recommended):**
   ```bash
   ./check-uncommitted-changes.sh --force
   ```

## Contributing

When committing changes:
1. Ensure `.gitignore` patterns are appropriate
2. Don't commit sensitive information (`.env` files are ignored)
3. Test scripts before committing

## Notes

- Tracked files (like existing `.lnk` shortcuts and `desktop.ini`) remain tracked even if they match common ignore patterns
- The repository preserves Desktop configuration state across machines
- Peace configurations are tracked to backup audio equalizer settings
