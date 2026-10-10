# TechVision Portfolio - Complete Startup Guide

## Quick Start (Windows)

### Option 1: Using the Batch Script

1. **Open Command Prompt** in the `portfolio-3d` directory
2. **Run the startup script:**
   ```bash
   startup.bat
   ```
3. **Wait for the server to start** (about 30-60 seconds)
4. **Open your browser** and go to:
   ```
   http://localhost:5000
   ```

### Option 2: Manual Setup

1. **Open Command Prompt** in the `portfolio-3d` directory
2. **Navigate to Python backend:**
   ```bash
   cd backend\python
   ```
3. **Create virtual environment:**
   ```bash
   python -m venv venv
   ```
4. **Activate virtual environment:**
   ```bash
   venv\Scripts\activate
   ```
5. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```
6. **Run the Flask server:**
   ```bash
   python app.py
   ```
7. **Open browser** at: `http://localhost:5000`

## Quick Start (macOS/Linux)

### Option 1: Using the Shell Script

1. **Make the script executable:**
   ```bash
   chmod +x startup.sh
   ```

2. **Run the startup script:**
   ```bash
   ./startup.sh
   ```

3. **Open your browser** at: `http://localhost:5000`

### Option 2: Manual Setup

1. **Open Terminal** in the `portfolio-3d` directory
2. **Navigate to Python backend:**
   ```bash
   cd backend/python
   ```
3. **Create virtual environment:**
   ```bash
   python3 -m venv venv
   ```
4. **Activate virtual environment:**
   ```bash
   source venv/bin/activate
   ```
5. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```
6. **Run the Flask server:**
   ```bash
   python3 app.py
   ```
7. **Open browser** at: `http://localhost:5000`

## What You'll See

When the server starts, you'll see:

1. **Loading Screen**: A beautiful animated loading screen with the TechVision logo
2. **3D Office Environment**: After loading, you'll be in a 3D virtual office
3. **Reception Area**: Meet the receptionist who will guide you
4. **Dialogue Options**: Choose what you want to explore:
   - View Projects
   - Our Skills
   - Meet Our CEO
   - Our Team
   - About Company

## User Journey

### 1. Welcome at Reception
- The receptionist avatar greets you
- Dialogue box shows welcome message
- Click any option to explore

### 2. View Projects
- See all company projects in a grid
- Each project shows:
  - Title and description
  - Technologies used
  - Status (Live/In Development)
- Click "Back to Reception" anytime

### 3. Meet the CEO
- Enter the CEO's office
- See Dr. Sarah Mitchell's avatar
- Read her bio and achievements
- Click "Send Email" to contact her
- Click "Call CEO" to make a call

### 4. Contact Form
- Fill in your details:
  - Name
  - Email
  - Company
  - Interest (Project, Employment, Consulting, etc.)
  - Message
- Click "Send Message"
- Get a success notification

### 5. Skills Showcase
- See all technical skills
- Each skill shows:
  - Skill name
  - Proficiency level (percentage)
  - Icon representation
- Skill bars animate when loaded

### 6. Team Section
- Meet the leadership team
- Each team member shows:
  - Name
  - Role
  - Avatar placeholder

### 7. About Company
- Learn about TechVision Solutions
- See company statistics:
  - Number of employees
  - Projects completed
  - Years of experience
  - Countries served
- Numbers animate when loaded

## Keyboard Shortcuts

- **Mouse Drag**: Rotate the 3D view
- **Scroll Wheel**: Zoom in/out
- **Right Click + Drag**: Pan the camera
- **ESC**: Return to reception

## Troubleshooting

### "Port 5000 already in use"
The port might be occupied by another application.

**Solution 1**: Kill the process using port 5000
```bash
# Windows
netstat -ano | findstr :5000
taskkill /PID <PID> /F

# macOS/Linux
lsof -i :5000
kill -9 <PID>
```

**Solution 2**: Change the port in `app.py`
```python
app.run(debug=True, host='0.0.0.0', port=5001)
```

### "ModuleNotFoundError: No module named 'flask'"
Flask is not installed.

**Solution**:
```bash
cd backend\python
venv\Scripts\activate
pip install -r requirements.txt
```

### "Three.js not loading"
The 3D graphics might not be rendering.

**Solutions**:
1. Clear browser cache (Ctrl+Shift+Delete)
2. Try a different browser (Chrome recommended)
3. Update your graphics drivers
4. Check browser console for errors (F12)

### "Dialogue not appearing"
The reception dialogue might not be showing.

**Solution**:
1. Refresh the page (F5)
2. Check browser console for JavaScript errors (F12)
3. Ensure Three.js is loading (check Network tab)

### "Projects not loading"
The project data might not be displaying.

**Solution**:
1. Check if Python server is running
2. Open browser DevTools (F12) → Network tab
3. Verify `/api/projects` returns data
4. Check console for errors

## API Testing

You can test the API endpoints directly:

### Get All Portfolio Data
```bash
curl http://localhost:5000/api/portfolio
```

### Get Projects
```bash
curl http://localhost:5000/api/projects
```

### Get Skills
```bash
curl http://localhost:5000/api/skills
```

### Get Team
```bash
curl http://localhost:5000/api/team
```

### Get CEO Details
```bash
curl http://localhost:5000/api/ceo
```

### Submit Contact Form
```bash
curl -X POST http://localhost:5000/api/contact \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john@example.com",
    "company": "Acme Corp",
    "interest": "project",
    "message": "Hello, I want to collaborate on a project!"
  }'
```

## Customization Tips

### Change Company Name
Edit `backend/python/app.py`:
```python
PORTFOLIO_DATA = {
    "company": {
        "name": "Your Company Name",
        ...
    }
}
```

### Change CEO Name
```python
PORTFOLIO_DATA = {
    "ceo": {
        "name": "CEO Name",
        ...
    }
}
```

### Change Colors
Edit `static/css/style.css`:
```css
:root {
    --primary-color: #YOUR_COLOR;
    --secondary-color: #YOUR_COLOR;
    ...
}
```

### Add New Projects
Add to the `projects` array in `app.py`:
```python
{
    "id": 5,
    "title": "New Project",
    "description": "Project description",
    "category": "Category",
    "technologies": ["Tech1", "Tech2"],
    "status": "Live"
}
```

## Performance Tips

1. **Close unnecessary browser tabs** to free up memory
2. **Use Chrome or Firefox** for best Three.js performance
3. **Update graphics drivers** for better 3D rendering
4. **Disable hardware acceleration** if experiencing issues
5. **Use a modern browser** (Chrome 90+, Firefox 88+, Safari 14+)

## Next Steps

After starting the portfolio:

1. **Explore all scenes** by clicking the dialogue options
2. **Try the 3D controls** (drag to rotate, scroll to zoom)
3. **Fill out the contact form** to test the submission
4. **Check the API responses** using browser DevTools
5. **Customize the content** to match your needs

## Support

If you encounter any issues:

1. Check the browser console (F12) for errors
2. Review the README.md for more details
3. Test API endpoints using curl or Postman
4. Ensure all dependencies are installed

## Enjoy Your 3D Portfolio! 🎉

You now have a stunning, interactive 3D portfolio website that:
- ✅ Features a realistic office tour
- ✅ Has an engaging receptionist guide
- ✅ Showcases projects, skills, and team
- ✅ Allows direct CEO contact
- ✅ Provides a professional first impression

**Happy exploring!** 🚀
