@echo off
REM Script to check for uncommitted changes and proceed with operations
REM Usage: check-uncommitted-changes.bat [--force]

setlocal enabledelayedexpansion

set "FORCE=false"
if "%1"=="--force" set "FORCE=true"

echo Checking for uncommitted changes...

REM Check if there are uncommitted changes
git status --porcelain > nul 2>&1
for /f %%i in ('git status --porcelain ^| find /c /v ""') do set COUNT=%%i

if %COUNT% gtr 0 (
    echo ⚠️  Uncommitted changes detected:
    git status --short
    
    if "%FORCE%"=="true" (
        echo.
        echo ✅ Proceeding despite uncommitted changes (--force flag used)
        exit /b 0
    ) else (
        echo.
        echo Options:
        echo   1. Commit your changes: git add . ^&^& git commit -m "your message"
        echo   2. Stash your changes: git stash
        echo   3. Discard your changes: git checkout -- .
        echo   4. Run with --force flag to proceed anyway: check-uncommitted-changes.bat --force
        echo.
        echo To proceed despite uncommitted changes, run:
        echo   check-uncommitted-changes.bat --force
        exit /b 1
    )
) else (
    echo ✅ No uncommitted changes detected. Safe to proceed.
    exit /b 0
)
