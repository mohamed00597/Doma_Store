@echo off
echo ==========================================
echo   Deploying My Store to Firebase Hosting
echo ==========================================
echo.

REM Check if Firebase CLI is installed
firebase --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Firebase CLI not found!
    echo.
    echo Please install it first:
    echo npm install -g firebase-tools
    echo.
    pause
    exit /b 1
)

echo [1/4] Logging in to Firebase...
firebase login

echo.
echo [2/4] Initializing project...
firebase init hosting --project my-store-bf8a3

echo.
echo [3/4] Copying files to public folder...
if not exist "public" mkdir public
xcopy /E /I /Y index.html publicxcopy /E /I /Y css public\cssxcopy /E /I /Y js public\jsxcopy /E /I /Y admin publicdminxcopy /E /I /Y manifest.json publicxcopy /E /I /Y firebase-messaging-sw.js public
echo.
echo [4/4] Deploying to Firebase...
firebase deploy --only hosting

echo.
echo ==========================================
echo   Deployment Complete!
echo   Your site: https://my-store-bf8a3.web.app
echo ==========================================
pause
