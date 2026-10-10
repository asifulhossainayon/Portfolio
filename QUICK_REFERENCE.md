# TechVision Portfolio - Quick Reference Card

## 🚀 Quick Start

### Windows
```bash
cd portfolio-3d
startup.bat
```

### macOS/Linux
```bash
cd portfolio-3d
./startup.sh
```

### Manual (Python)
```bash
cd backend/python
python -m venv venv
venv\Scripts\activate  # Windows
source venv/bin/activate  # macOS/Linux
pip install -r requirements.txt
python app.py
```

### Manual (Java)
```bash
cd backend/java
mvn clean package
mvn spring-boot:run
```

## 🌐 Access URLs

- **Frontend**: http://localhost:5000
- **Java API**: http://localhost:8080
- **Java Health**: http://localhost:8080/api/health
- **Java H2 Console**: http://localhost:8080/h2-console

## 📁 Project Structure

```
portfolio-3d/
├── frontend/
│   └── index.html              # Main HTML file
├── static/
│   ├── css/
│   │   ├── style.css           # Main styles
│   │   └── animations.css      # Animation keyframes
│   ├── js/
│   │   └── main.js             # Three.js + UI logic
│   ├── images/                 # Image assets
│   └── models/                 # 3D model files
├── backend/
│   ├── python/
│   │   ├── app.py              # Flask app
│   │   ├── requirements.txt    # Python deps
│   │   └── static/             # Static files for Flask
│   └── java/
│       ├── pom.xml             # Maven config
│       └── src/main/java/      # Java source
├── templates/                  # Additional templates
├── .gitignore                  # Git ignore rules
├── README.md                   # Full documentation
├── STARTUP_GUIDE.md            # Detailed startup instructions
├── DEPLOYMENT_GUIDE.md         # Production deployment
├── API_DOCUMENTATION.md        # API reference
├── CHANGELOG.md                # Version history
├── QUICK_REFERENCE.md          # This file
└── startup.{bat,sh}            # Startup scripts
```

## 🎮 User Interface

### Scenes
1. **Reception** - Welcome screen with dialogue options
2. **Projects** - Browse all company projects
3. **CEO Office** - Meet Dr. Sarah Mitchell
4. **Contact** - Submit contact form
5. **Skills** - View technical skills
6. **Team** - Meet the leadership team
7. **About** - Learn about the company

### Navigation
- **Tour Office** - Return to reception
- **Projects** - View projects gallery
- **Contact** - Open contact form

### 3D Controls
- **Left Click + Drag** - Rotate view
- **Scroll Wheel** - Zoom in/out
- **Right Click + Drag** - Pan camera
- **ESC** - Return to reception

## 🎨 Color Palette

```css
--primary-color: #6366f1      /* Indigo */
--secondary-color: #8b5cf6    /* Violet */
--accent-color: #ec4899       /* Pink */
--dark-bg: #0f172a            /* Dark Blue */
--darker-bg: #020617          /* Nearly Black */
--success-color: #10b981      /* Green */
--warning-color: #f59e0b      /* Amber */
```

## 🔌 API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/portfolio` | GET | All portfolio data |
| `/api/projects` | GET | Projects list |
| `/api/skills` | GET | Skills list |
| `/api/team` | GET | Team members |
| `/api/ceo` | GET | CEO details |
| `/api/company` | GET | Company info |
| `/api/contact` | POST | Contact form |
| `/api/health` | GET | Health check |
| `/api/stats` | GET | Company stats |

## 📦 Dependencies

### Python (backend/python)
```
Flask==2.3.0
gunicorn==21.2.0
python-dotenv==1.0.0
```

### Java (backend/java)
```
Spring Boot 3.2.0
Java 17
Maven
```

### Frontend (CDN)
```
Three.js r128
Font Awesome 6.4.0
```

## 🛠️ Common Commands

### Python Backend
```bash
# Install dependencies
pip install -r requirements.txt

# Run development server
python app.py

# Run with Gunicorn
gunicorn -w 4 app:app
```

### Java Backend
```bash
# Build
mvn clean package

# Run
mvn spring-boot:run

# Run JAR
java -jar target/*.jar
```

### Docker
```bash
# Build
docker-compose build

# Run
docker-compose up -d

# Logs
docker-compose logs -f
```

## 🐛 Troubleshooting

### Port Already in Use
```bash
# Windows
netstat -ano | findstr :5000
taskkill /PID <PID> /F

# macOS/Linux
lsof -i :5000
kill -9 <PID>
```

### Clear Browser Cache
```bash
# Chrome/Edge
Ctrl + Shift + Delete

# Firefox
Ctrl + Shift + Delete
```

### Restart Server
```bash
# Press Ctrl+C to stop
# Then restart with:
python app.py
```

## 📱 Browser Support

| Browser | Version | Notes |
|---------|---------|-------|
| Chrome | 90+ | Recommended |
| Firefox | 88+ | Recommended |
| Safari | 14+ | Recommended |
| Edge | 90+ | Recommended |
| Opera | 77+ | Recommended |

## 📊 Performance Tips

1. Use Chrome for best Three.js performance
2. Close unnecessary browser tabs
3. Update graphics drivers
4. Disable hardware acceleration if needed
5. Use a modern browser

## 🔒 Security Checklist

- [ ] Enable HTTPS in production
- [ ] Set secure cookies
- [ ] Configure CORS properly
- [ ] Enable rate limiting
- [ ] Set security headers
- [ ] Use environment variables for secrets
- [ ] Keep dependencies updated

## 📈 Monitoring

### Health Check
```bash
curl http://localhost:5000/api/health
```

### View Logs
```bash
# Python
tail -f backend/python/logs/app.log

# Java
tail -f backend/java/logs/application.log
```

## 🎯 Customization

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

### Change Colors
Edit `static/css/style.css`:
```css
:root {
    --primary-color: #YOUR_COLOR;
    ...
}
```

### Add New Project
Edit `backend/python/app.py`:
```python
PORTFOLIO_DATA["projects"].append({
    "id": 5,
    "title": "New Project",
    ...
})
```

## 📞 Support

### Documentation
- README.md - Full documentation
- STARTUP_GUIDE.md - Detailed startup instructions
- DEPLOYMENT_GUIDE.md - Production deployment
- API_DOCUMENTATION.md - API reference

### Issues
1. Check browser console (F12)
2. Review error logs
3. Test API endpoints with curl
4. Verify dependencies are installed

## 🎉 Enjoy Your Portfolio!

You now have a stunning 3D portfolio website with:
- ✅ Interactive 3D office tour
- ✅ Engaging receptionist guide
- ✅ Dynamic project showcase
- ✅ CEO contact options
- ✅ Professional design
- ✅ Mobile responsive

**Happy exploring!** 🚀
