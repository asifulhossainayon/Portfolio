# TechVision Portfolio - API Documentation

## Base URL
```
http://localhost:5000/api
```

## Authentication
All endpoints are currently public. In production, you can add JWT or OAuth authentication.

## Endpoints

### 1. Get All Portfolio Data
**Endpoint:** `GET /api/portfolio`

**Description:** Returns complete portfolio data including company info, CEO details, projects, skills, and team.

**Response:**
```json
{
  "company": {
    "name": "TechVision Solutions",
    "tagline": "Innovating the Future",
    "description": "Leading technology solutions provider..."
  },
  "ceo": {
    "name": "Dr. Sarah Mitchell",
    "title": "Chief Executive Officer",
    "email": "sarah.mitchell@techvision.com",
    "phone": "+1 (555) 123-4567",
    "bio": "Dr. Sarah Mitchell is a visionary leader...",
    "education": "PhD Computer Science, MIT",
    "experience": "20+ years in technology leadership",
    "achievements": [
      "Led company growth from 50 to 500+ employees",
      "Awarded Tech Leader of the Year 2023",
      "Published author on AI ethics and innovation"
    ]
  },
  "projects": [
    {
      "id": 1,
      "title": "AI Healthcare Platform",
      "description": "Revolutionizing patient care...",
      "category": "Healthcare",
      "technologies": ["Python", "TensorFlow", "React"],
      "status": "Live"
    }
  ],
  "skills": [
    {
      "name": "Artificial Intelligence",
      "level": 95,
      "icon": "fa-brain"
    }
  ],
  "team": [
    {
      "name": "James Wilson",
      "role": "CTO",
      "email": "james.wilson@techvision.com"
    }
  ]
}
```

**Status Code:** `200 OK`

---

### 2. Get All Projects
**Endpoint:** `GET /api/projects`

**Description:** Returns a list of all company projects.

**Response:**
```json
[
  {
    "id": 1,
    "title": "AI Healthcare Platform",
    "description": "Revolutionizing patient care with AI-driven diagnostics and personalized treatment plans.",
    "category": "Healthcare",
    "technologies": ["Python", "TensorFlow", "React"],
    "status": "Live"
  },
  {
    "id": 2,
    "title": "FinTech Analytics Dashboard",
    "description": "Real-time financial analytics platform for enterprise clients.",
    "category": "FinTech",
    "technologies": ["Java", "Spring Boot", "Angular"],
    "status": "Live"
  },
  {
    "id": 3,
    "title": "Smart City IoT Solution",
    "description": "Connected infrastructure management for urban development.",
    "category": "IoT",
    "technologies": ["Node.js", "MQTT", "Vue.js"],
    "status": "In Development"
  },
  {
    "id": 4,
    "title": "E-Learning Platform",
    "description": "AI-powered personalized learning experiences for students.",
    "category": "Education",
    "technologies": ["Python", "Django", "React Native"],
    "status": "Live"
  }
]
```

**Status Code:** `200 OK`

---

### 3. Get All Skills
**Endpoint:** `GET /api/skills`

**Description:** Returns a list of all technical skills with proficiency levels.

**Response:**
```json
[
  {
    "name": "Artificial Intelligence",
    "level": 95,
    "icon": "fa-brain"
  },
  {
    "name": "Cloud Computing",
    "level": 90,
    "icon": "fa-cloud"
  },
  {
    "name": "Full-Stack Development",
    "level": 88,
    "icon": "fa-code"
  },
  {
    "name": "Data Science",
    "level": 92,
    "icon": "fa-database"
  },
  {
    "name": "Cybersecurity",
    "level": 85,
    "icon": "fa-shield-alt"
  },
  {
    "name": "Mobile Development",
    "level": 82,
    "icon": "fa-mobile-alt"
  }
]
```

**Status Code:** `200 OK`

---

### 4. Get Team Members
**Endpoint:** `GET /api/team`

**Description:** Returns a list of all team members.

**Response:**
```json
[
  {
    "name": "James Wilson",
    "role": "CTO",
    "email": "james.wilson@techvision.com"
  },
  {
    "name": "Emily Chen",
    "role": "Head of Engineering",
    "email": "emily.chen@techvision.com"
  },
  {
    "name": "Michael Brown",
    "role": "VP of Product",
    "email": "michael.brown@techvision.com"
  }
]
```

**Status Code:** `200 OK`

---

### 5. Get CEO Details
**Endpoint:** `GET /api/ceo`

**Description:** Returns detailed information about the CEO.

**Response:**
```json
{
  "name": "Dr. Sarah Mitchell",
  "title": "Chief Executive Officer",
  "email": "sarah.mitchell@techvision.com",
  "phone": "+1 (555) 123-4567",
  "bio": "Dr. Sarah Mitchell is a visionary leader with 20+ years of experience in technology innovation and business strategy. She holds a PhD in Computer Science from MIT and has led multiple successful tech transformations.",
  "education": "PhD Computer Science, MIT",
  "experience": "20+ years in technology leadership",
  "achievements": [
    "Led company growth from 50 to 500+ employees",
    "Awarded Tech Leader of the Year 2023",
    "Published author on AI ethics and innovation"
  ]
}
```

**Status Code:** `200 OK`

---

### 6. Get Company Information
**Endpoint:** `GET /api/company`

**Description:** Returns company information.

**Response:**
```json
{
  "name": "TechVision Solutions",
  "tagline": "Innovating the Future",
  "description": "Leading technology solutions provider specializing in AI, cloud computing, and digital transformation."
}
```

**Status Code:** `200 OK`

---

### 7. Submit Contact Form
**Endpoint:** `POST /api/contact`

**Description:** Processes contact form submissions.

**Request Body:**
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "company": "Acme Corp",
  "interest": "project",
  "message": "Hello, I want to collaborate on a project!"
}
```

**Response:**
```json
{
  "success": true,
  "message": "Thank you for your message! We'll get back to you soon.",
  "contactInfo": {
    "email": "sarah.mitchell@techvision.com",
    "phone": "+1 (555) 123-4567",
    "address": "123 Innovation Drive, Tech Park, CA 94025"
  }
}
```

**Status Code:** `200 OK`

---

### 8. Health Check
**Endpoint:** `GET /api/health`

**Description:** Returns API health status.

**Response:**
```json
"TechVision Portfolio API is running!"
```

**Status Code:** `200 OK`

---

### 9. Get Statistics
**Endpoint:** `GET /api/stats`

**Description:** Returns company statistics.

**Response:**
```json
{
  "employees": 500,
  "projectsCompleted": 150,
  "yearsExperience": 10,
  "countriesServed": 25
}
```

**Status Code:** `200 OK`

---

## Error Responses

### 400 Bad Request
```json
{
  "error": "Bad Request",
  "message": "Invalid request data",
  "details": [
    {
      "field": "email",
      "message": "Invalid email format"
    }
  ]
}
```

### 404 Not Found
```json
{
  "error": "Not Found",
  "message": "Resource not found"
}
```

### 500 Internal Server Error
```json
{
  "error": "Internal Server Error",
  "message": "Something went wrong",
  "details": "Check server logs for more information"
}
```

## Request Headers

All requests should include:
```
Content-Type: application/json
Accept: application/json
```

## Response Headers

All responses include:
```
Content-Type: application/json
Access-Control-Allow-Origin: *
Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS
Access-Control-Allow-Headers: Content-Type, Authorization
```

## Rate Limiting

Currently, no rate limiting is implemented. For production:

```python
# Add to app.py
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

limiter = Limiter(
    app=app,
    key_func=get_remote_address,
    default_limits=["100 per hour"],
    storage_uri="memory://"
)

@app.route('/api/contact', methods=['POST'])
@limiter.limit("10 per minute")
def contact():
    # ...
```

## CORS Configuration

CORS is enabled for all origins by default. For production:

```python
from flask_cors import CORS

app = Flask(__name__)
CORS(app, resources={
    r"/*": {
        "origins": ["https://yourdomain.com"],
        "methods": ["GET", "POST", "OPTIONS"],
        "allow_headers": ["Content-Type", "Authorization"]
    }
})
```

## Testing with cURL

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

### Get CEO
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

## Testing with Postman

1. Import the API collection (if available)
2. Set base URL to `http://localhost:5000/api`
3. Run all requests
4. Verify responses

## Testing with Swagger

If you enable Swagger in the Java backend:
```
http://localhost:8080/swagger-ui.html
```

## Database Schema (Optional)

If you want to persist contact form submissions, here's a sample schema:

```sql
CREATE TABLE contacts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    company VARCHAR(255),
    interest VARCHAR(50),
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Adding Database Support

To add database support for contact submissions:

1. Install SQLAlchemy:
```bash
pip install flask-sqlalchemy
```

2. Update `app.py`:
```python
from flask_sqlalchemy import SQLAlchemy

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///contacts.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Contact(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255), nullable=False)
    email = db.Column(db.String(255), nullable=False)
    company = db.Column(db.String(255))
    interest = db.Column(db.String(50))
    message = db.Column(db.Text)
    created_at = db.Column(db.DateTime, default=db.func.now())

@app.route('/api/contact', methods=['POST'])
def contact():
    contact = Contact(
        name=request.json['name'],
        email=request.json['email'],
        company=request.json.get('company'),
        interest=request.json.get('interest'),
        message=request.json.get('message')
    )
    db.session.add(contact)
    db.session.commit()
    return jsonify({"success": True, "message": "Message received!"})
```

## Versioning

Current API version: `v1`

To version your API:
```
http://localhost:5000/api/v1/projects
```

## Future Enhancements

- [ ] Add JWT authentication
- [ ] Implement rate limiting
- [ ] Add request validation with Pydantic
- [ ] Add API versioning
- [ ] Implement caching with Redis
- [ ] Add GraphQL endpoint
- [ ] Implement WebSocket for real-time updates
- [ ] Add file upload support for project attachments

---

**For more information, see the main README.md file!**
