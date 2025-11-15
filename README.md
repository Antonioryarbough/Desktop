# Desktop Configuration Repository

This repository tracks Windows Desktop configurations, shortcuts, and application settings.

## Contents

- **shortcuts/**: Windows shortcuts (.lnk files) for various applications
- **Documents/**: Document configurations and Peace audio equalizer settings
- **AI-ANTONIOS-INTELIGENCE/**: Custom application files
- **desktop.ini**: Windows desktop configuration
- **Peace.lnk**: Peace Equalizer shortcut

## Git Configuration

### .gitignore Files

The repository includes `.gitignore` files to prevent tracking of:
- System temporary files (Thumbs.db, etc.)
- Node.js dependencies (node_modules/)
- Environment variables (.env files)
- Build artifacts (dist/, build/)
- Log and backup files (*.log, *.bak)

**Note**: Windows shortcuts (.lnk) and desktop.ini files are intentionally tracked in this repository.

### Checking for Uncommitted Changes

Use the provided script to check if there are any uncommitted changes:

```bash
bash check-uncommitted-changes.sh
```

The script will:
- Return exit code 0 if the working tree is clean
- Return exit code 1 and list uncommitted files if changes are detected

### Workflow

1. **Check status before committing:**
   ```bash
   bash check-uncommitted-changes.sh
   ```

2. **View what changed:**
   ```bash
   git status
   git diff
   ```

3. **Stage and commit changes:**
   ```bash
   git add <file>
   git commit -m "Description of changes"
   git push
   ```

## Deployment

This repository is connected to deployment at: https://desktop-smoky.vercel.app

Changes pushed to the main branch are automatically deployed.

## Troubleshooting

### "Uncommitted changes detected" error

If you encounter this message:

1. Run `bash check-uncommitted-changes.sh` to see which files have changes
2. Review the changes with `git diff`
3. Either commit the changes or discard them with `git restore <file>`

### System files being tracked

If Windows is generating files that shouldn't be tracked:

1. Add them to `.gitignore`
2. If they're already tracked, remove them from git:
   ```bash
   git rm --cached <file>
   git commit -m "Remove tracked system file"
   ```

## Support

For issues or questions, please open an issue in this repository.
