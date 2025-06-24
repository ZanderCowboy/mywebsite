@echo off
REM Script to generate firebase_options.dart from template using environment variables
REM Usage: scripts\setup_firebase_config.bat

set TEMPLATE_FILE=lib\firebase_options.dart.template
set OUTPUT_FILE=lib\firebase_options.dart

REM Check if template file exists
if not exist "%TEMPLATE_FILE%" (
    echo Error: Template file %TEMPLATE_FILE% not found!
    exit /b 1
)

REM Check if .env file exists for local development
set ENV_FILE=.env
if exist "%ENV_FILE%" (
    echo Loading environment variables from %ENV_FILE%
    for /f "tokens=*" %%a in ('type "%ENV_FILE%"') do (
        for /f "tokens=1,2 delims==" %%b in ("%%a") do (
            if not "%%b"=="" if not "%%c"=="" (
                set "%%b=%%c"
            )
        )
    )
)

REM Check if all required environment variables are set
set MISSING_VARS=
if "%FIREBASE_WEB_API_KEY%"=="" set MISSING_VARS=%MISSING_VARS% FIREBASE_WEB_API_KEY
if "%FIREBASE_WEB_APP_ID%"=="" set MISSING_VARS=%MISSING_VARS% FIREBASE_WEB_APP_ID
if "%FIREBASE_MESSAGING_SENDER_ID%"=="" set MISSING_VARS=%MISSING_VARS% FIREBASE_MESSAGING_SENDER_ID
if "%FIREBASE_PROJECT_ID%"=="" set MISSING_VARS=%MISSING_VARS% FIREBASE_PROJECT_ID
if "%FIREBASE_AUTH_DOMAIN%"=="" set MISSING_VARS=%MISSING_VARS% FIREBASE_AUTH_DOMAIN
if "%FIREBASE_STORAGE_BUCKET%"=="" set MISSING_VARS=%MISSING_VARS% FIREBASE_STORAGE_BUCKET
if "%FIREBASE_MEASUREMENT_ID%"=="" set MISSING_VARS=%MISSING_VARS% FIREBASE_MEASUREMENT_ID
if "%FIREBASE_ANDROID_API_KEY%"=="" set MISSING_VARS=%MISSING_VARS% FIREBASE_ANDROID_API_KEY
if "%FIREBASE_ANDROID_APP_ID%"=="" set MISSING_VARS=%MISSING_VARS% FIREBASE_ANDROID_APP_ID
if "%FIREBASE_IOS_API_KEY%"=="" set MISSING_VARS=%MISSING_VARS% FIREBASE_IOS_API_KEY
if "%FIREBASE_IOS_APP_ID%"=="" set MISSING_VARS=%MISSING_VARS% FIREBASE_IOS_APP_ID
if "%FIREBASE_IOS_BUNDLE_ID%"=="" set MISSING_VARS=%MISSING_VARS% FIREBASE_IOS_BUNDLE_ID

if not "%MISSING_VARS%"=="" (
    echo Error: The following environment variables are missing:
    echo %MISSING_VARS%
    echo.
    echo Please set them in your environment or create a .env file with these values.
    echo Example .env file:
    echo FIREBASE_WEB_API_KEY=your_web_api_key_here
    echo FIREBASE_WEB_APP_ID=your_web_app_id_here
    echo # ... etc
    exit /b 1
)

REM Copy template and replace placeholders
copy "%TEMPLATE_FILE%" "%OUTPUT_FILE%" >nul

REM Replace placeholders with environment variables using PowerShell
powershell -Command "(Get-Content '%OUTPUT_FILE%') -replace '{{FIREBASE_WEB_API_KEY}}', '%FIREBASE_WEB_API_KEY%' | Set-Content '%OUTPUT_FILE%'"
powershell -Command "(Get-Content '%OUTPUT_FILE%') -replace '{{FIREBASE_WEB_APP_ID}}', '%FIREBASE_WEB_APP_ID%' | Set-Content '%OUTPUT_FILE%'"
powershell -Command "(Get-Content '%OUTPUT_FILE%') -replace '{{FIREBASE_MESSAGING_SENDER_ID}}', '%FIREBASE_MESSAGING_SENDER_ID%' | Set-Content '%OUTPUT_FILE%'"
powershell -Command "(Get-Content '%OUTPUT_FILE%') -replace '{{FIREBASE_PROJECT_ID}}', '%FIREBASE_PROJECT_ID%' | Set-Content '%OUTPUT_FILE%'"
powershell -Command "(Get-Content '%OUTPUT_FILE%') -replace '{{FIREBASE_AUTH_DOMAIN}}', '%FIREBASE_AUTH_DOMAIN%' | Set-Content '%OUTPUT_FILE%'"
powershell -Command "(Get-Content '%OUTPUT_FILE%') -replace '{{FIREBASE_STORAGE_BUCKET}}', '%FIREBASE_STORAGE_BUCKET%' | Set-Content '%OUTPUT_FILE%'"
powershell -Command "(Get-Content '%OUTPUT_FILE%') -replace '{{FIREBASE_MEASUREMENT_ID}}', '%FIREBASE_MEASUREMENT_ID%' | Set-Content '%OUTPUT_FILE%'"
powershell -Command "(Get-Content '%OUTPUT_FILE%') -replace '{{FIREBASE_ANDROID_API_KEY}}', '%FIREBASE_ANDROID_API_KEY%' | Set-Content '%OUTPUT_FILE%'"
powershell -Command "(Get-Content '%OUTPUT_FILE%') -replace '{{FIREBASE_ANDROID_APP_ID}}', '%FIREBASE_ANDROID_APP_ID%' | Set-Content '%OUTPUT_FILE%'"
powershell -Command "(Get-Content '%OUTPUT_FILE%') -replace '{{FIREBASE_IOS_API_KEY}}', '%FIREBASE_IOS_API_KEY%' | Set-Content '%OUTPUT_FILE%'"
powershell -Command "(Get-Content '%OUTPUT_FILE%') -replace '{{FIREBASE_IOS_APP_ID}}', '%FIREBASE_IOS_APP_ID%' | Set-Content '%OUTPUT_FILE%'"
powershell -Command "(Get-Content '%OUTPUT_FILE%') -replace '{{FIREBASE_IOS_BUNDLE_ID}}', '%FIREBASE_IOS_BUNDLE_ID%' | Set-Content '%OUTPUT_FILE%'"

echo Successfully generated %OUTPUT_FILE% from template!
echo Note: This file is gitignored and will not be committed to the repository. 