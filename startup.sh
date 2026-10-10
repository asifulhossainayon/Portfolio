#!/bin/bash

echo "========================================"
echo "  TechVision Portfolio - Startup Guide"
echo "========================================"
echo ""

cd backend/python

if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

echo "Activating virtual environment..."
source venv/bin/activate

echo "Installing dependencies..."
pip install -r requirements.txt

echo ""
echo "Starting Flask server on http://localhost:5000"
echo "Press Ctrl+C to stop the server"
echo ""

python app.py
