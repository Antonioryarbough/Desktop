@echo off
REM Script to check for uncommitted changes and proceed with operations
REM Usage: check-uncommitted-changes.bat [--force]

setlocal enabledelayedexpansion

set "FORCE=false"
if "%1"=="--force" set "FORCE=true"

echo Checking for uncommitted changes...
echo.

REM Check if there are uncommitted changes
git status --porcelain > nul 2>&1
if errorlevel 1 (
    echo Error: Not a git repository
    exit /b 1
)

git status --porcelain > temp_status.txt
set /p STATUS=<temp_status.txt
del temp_status.txt

if defined STATUS (
    echo WARNING: Uncommitted changes detected:
    echo.
    git status --short
    echo.
    
    if "%FORCE%"=="true" (
        echo ✓ Proceeding despite uncommitted changes (--force flag used)
        exit /b 0
    ) else (
        echo Options:
        echo   1. Commit your changes: git add . ^&^& git commit -m "your message"
        echo   2. Stash your changes: git stash
        echo   3. Discard your changes: git checkout -- .
        echo   4. Run with --force flag: check-uncommitted-changes.bat --force
        echo.
        echo To proceed despite uncommitted changes, run:
        echo   check-uncommitted-changes.bat --force
        exit /b 1
    )
) else (
    echo ✓ No uncommitted changes detected. Safe to proceed.
    exit /b 0
)
