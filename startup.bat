@echo off
echo ========================================
echo   TechVision Portfolio - Startup Guide
echo ========================================
echo.

echo Starting Python Flask Backend...
echo.

cd backend\python

if not exist venv (
    echo Creating virtual environment...
    python -m venv venv
)

echo Activating virtual environment...
call venv\Scripts\activate.bat

echo Installing dependencies...
pip install -r requirements.txt

echo.
echo Starting Flask server on http://localhost:5000
echo Press Ctrl+C to stop the server
echo.

python app.py

cd ..\..\
