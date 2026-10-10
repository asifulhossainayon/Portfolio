# TechVision Solutions - 3D Interactive Portfolio Website

A stunning, immersive 3D portfolio website featuring an interactive office tour experience. Built with Python Flask, Java Spring Boot, HTML5, CSS3, JavaScript, and Three.js for 3D graphics.

## 🌟 Features

- **3D Virtual Office Tour**: Navigate through a realistic 3D office environment
- **Interactive Reception**: Meet the receptionist who guides you through the portfolio
- **Dynamic Scenes**:
  - **Reception Area**: Welcome screen with dialogue options
  - **Projects Gallery**: Browse all company projects
  - **CEO's Office**: Meet Dr. Sarah Mitchell, the CEO
  - **Contact Form**: Drop your mail for projects or employment
  - **Skills Showcase**: Interactive skill level visualizations
  - **Team Section**: Meet the leadership team
  - **About Company**: Learn about TechVision Solutions
- **Particle Effects**: Beautiful floating particles and glow effects
- **Responsive Design**: Works on desktop and mobile devices
- **Real-time 3D Graphics**: Powered by Three.js

## 🏗️ Tech Stack

### Frontend
- **HTML5** - Semantic markup
- **CSS3** - Modern styling with gradients, glassmorphism, and animations
- **JavaScript (ES6+)** - Interactive logic
- **Three.js** - 3D graphics and animations
- **Font Awesome** - Icon library

### Backend - Python
- **Flask** - RESTful API server
- **Python 3.8+**

### Backend - Java
- **Spring Boot 3.2** - Java backend services
- **Maven** - Build tool
- **Java 17**

## 📁 Project Structure

```
portfolio-3d/
├── frontend/
│   └── index.html              # Main HTML file
├── static/
│   ├── css/
│   │   └── style.css           # All CSS styles
│   ├── js/
│   │   └── main.js             # Main JavaScript with Three.js
│   ├── images/                 # Image assets
│   └── models/                 # 3D model files
├── backend/
│   ├── python/
│   │   ├── app.py              # Flask application
│   │   └── requirements.txt    # Python dependencies
│   └── java/
│       ├── pom.xml             # Maven configuration
│       └── src/main/java/
│           └── com/portfolio/
│               ├── controller/
│               ├── model/
│               ├── service/
│               └── config/
├── templates/                  # Additional templates
└── README.md                   # This file
```

## 🚀 Quick Start

### Prerequisites
- Python 3.8+
- Java 17+
- A modern web browser with WebGL support

### Running the Python Backend

1. **Navigate to the Python backend directory:**
   ```bash
   cd portfolio-3d/backend/python
   ```

2. **Create a virtual environment (optional but recommended):**
   ```bash
   python -m venv venv
   ```

3. **Activate the virtual environment:**
   - Windows:
     ```bash
     venv\Scripts\activate
     ```
   - macOS/Linux:
     ```bash
     source venv/bin/activate
     ```

4. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

5. **Run the Flask application:**
   ```bash
   python app.py
   ```

6. **Open your browser and navigate to:**
   ```
   http://localhost:5000
   ```

### Running the Java Backend (Optional - for additional services)

1. **Navigate to the Java backend directory:**
   ```bash
   cd portfolio-3d/backend/java
   ```

2. **Build the project:**
   ```bash
   mvn clean package
   ```

3. **Run the Spring Boot application:**
   ```bash
   mvn spring-boot:run
   ```

4. **The API will be available at:**
   ```
   http://localhost:8080
   ```

### Running Both Backends

You can run both backends simultaneously:
- Python Flask on port 5000
- Java Spring Boot on port 8080

The frontend will connect to the Python backend by default.

## 🎮 User Experience Flow

1. **Loading Screen**: Beautiful animated loading with company logo
2. **Reception Scene**: 
   - Meet the receptionist avatar
   - Choose from dialogue options:
     - View Projects
     - Our Skills
     - Meet Our CEO
     - Our Team
     - About Company
3. **Explore Scenes**: Each scene is interactive and visually engaging
4. **Contact CEO**: From the CEO's office, send an email or call
5. **Submit Contact Form**: Drop your mail for projects, employment, or partnerships

## 🎨 Design Features

- **Glassmorphism**: Modern frosted glass effects
- **Gradient Accents**: Purple, blue, and pink gradients
- **Smooth Animations**: CSS transitions and Three.js animations
- **Particle Effects**: Floating particles for depth
- **Responsive Layout**: Adapts to all screen sizes
- **Dark Theme**: Professional dark color scheme

## 📱 Browser Support

- Chrome (recommended)
- Firefox
- Safari
- Edge
- Opera

All browsers must support WebGL for the 3D graphics to work properly.

## 🔌 API Endpoints (Python Backend)

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/portfolio` | GET | Get all portfolio data |
| `/api/projects` | GET | Get all projects |
| `/api/skills` | GET | Get all skills |
| `/api/team` | GET | Get team members |
| `/api/ceo` | GET | Get CEO details |
| `/api/company` | GET | Get company info |
| `/api/contact` | POST | Process contact form |

## 🎯 Customization

### Changing Company Information

Edit `portfolio-3d/backend/python/app.py` and update the `PORTFOLIO_DATA` dictionary:

```python
PORTFOLIO_DATA = {
    "company": {
        "name": "Your Company Name",
        ...
    },
    "ceo": {
        "name": "CEO Name",
        ...
    },
    ...
}
```

### Customizing Colors

Edit `portfolio-3d/static/css/style.css` and modify the CSS variables:

```css
:root {
    --primary-color: #6366f1;      /* Main accent color */
    --secondary-color: #8b5cf6;    /* Secondary accent */
    --accent-color: #ec4899;       /* Tertiary accent */
    ...
}
```

### Adding New Projects

Add to the `projects` array in `app.py`:

```python
{
    "id": 5,
    "title": "New Project Name",
    "description": "Project description...",
    "category": "Category",
    "technologies": ["Tech1", "Tech2"],
    "status": "Live"
}
```

## 🐛 Troubleshooting

### 3D Graphics Not Working
- Ensure WebGL is enabled in your browser
- Try updating your graphics drivers
- Check browser console for errors

### Port Already in Use
- Change the port in `app.py`: `app.run(port=5001)`
- Or kill the process using the port

### Three.js Loading Issues
- Check your internet connection (CDN loads Three.js)
- Clear browser cache
- Try a different browser

## 📄 License

This project is open source and available for educational and commercial use.

## 🤝 Contributing

Feel free to submit issues and pull requests!

## 🎉 Credits

- **Three.js**: https://threejs.org/
- **Font Awesome**: https://fontawesome.com/
- **Flask**: https://flask.palletsprojects.com/
- **Spring Boot**: https://spring.io/projects/spring-boot

---

**Built with ❤️ for TechVision Solutions**
