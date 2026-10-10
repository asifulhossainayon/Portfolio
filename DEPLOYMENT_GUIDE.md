# TechVision Portfolio - Deployment Guide

## Production Deployment Options

### Option 1: Deploy with Gunicorn (Python Backend)

#### Install Gunicorn
```bash
cd backend/python
pip install gunicorn
```

#### Create a Gunicorn configuration file
Create `backend/python/gunicorn.conf.py`:
```python
bind = "0.0.0.0:5000"
workers = 4
worker_class = "sync"
timeout = 120
keepalive = 5
```

#### Run with Gunicorn
```bash
gunicorn -c gunicorn.conf.py app:app
```

#### Or use Procfile for Heroku
Create `backend/python/Procfile`:
```
web: gunicorn -c gunicorn.conf.py app:app
```

### Option 2: Deploy with uWSGI

#### Install uWSGI
```bash
pip install uwsgi
```

#### Run with uWSGI
```bash
cd backend/python
uwsgi --http :5000 --wsgi-file app.py --callable app
```

### Option 3: Deploy with Nginx (Reverse Proxy)

#### Install Nginx
```bash
# Ubuntu/Debian
sudo apt-get install nginx

# CentOS/RHEL
sudo yum install nginx
```

#### Create Nginx configuration
Create `/etc/nginx/sites-available/portfolio`:
```nginx
server {
    listen 80;
    server_name yourdomain.com;

    # Frontend
    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    # Static files caching
    location /static/ {
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host $host;
    }
}
```

#### Enable the site
```bash
sudo ln -s /etc/nginx/sites-available/portfolio /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

### Option 4: Deploy with Docker

#### Create Dockerfile
Create `backend/python/Dockerfile`:
```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
```

#### Build and Run Docker Container
```bash
docker build -t techvision-portfolio .
docker run -p 5000:5000 techvision-portfolio
```

#### Create docker-compose.yml
Create `backend/python/docker-compose.yml`:
```yaml
version: '3.8'

services:
  portfolio:
    build: .
    ports:
      - "5000:5000"
    volumes:
      - ./static:/app/static
      - ./templates:/app/templates
    environment:
      - FLASK_ENV=production
    restart: unless-stopped
```

#### Run with Docker Compose
```bash
docker-compose up -d
```

### Option 5: Deploy on Heroku

#### Install Heroku CLI
```bash
# Download from https://devcenter.heroku.com/articles/heroku
```

#### Login to Heroku
```bash
heroku login
```

#### Create Procfile
Create `backend/python/Procfile`:
```
web: gunicorn app:app
```

#### Deploy to Heroku
```bash
cd backend/python
heroku create
heroku git:remote -a your-app-name
git push heroku main
```

### Option 6: Deploy on AWS EC2

#### Launch EC2 Instance
1. Choose Amazon Linux 2 or Ubuntu 22.04
2. Select appropriate instance type (t2.micro for development)

#### Connect to EC2
```bash
ssh -i your-key.pem ec2-user@your-instance-ip
```

#### Install Dependencies
```bash
# Update system
sudo yum update -y

# Install Python and pip
sudo yum install python3-pip -y

# Install Flask and Gunicorn
pip3 install flask gunicorn

# Clone your repository
git clone your-repo-url /var/www/portfolio
cd /var/www/portfolio

# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Create systemd service
sudo nano /etc/systemd/portfolio.service
```

#### Create Systemd Service
```ini
[Unit]
Description=TechVision Portfolio
After=network.target

[Service]
WorkingDirectory=/var/www/portfolio
Environment="PATH=/var/www/portfolio/venv/bin:$PATH"
ExecStart=/var/www/portfolio/venv/bin/gunicorn -c gunicorn.conf.py app:app
Restart=always

[Install]
WantedBy=multi-user.target
```

#### Enable and Start Service
```bash
sudo systemctl enable portfolio
sudo systemctl start portfolio
sudo systemctl status portfolio
```

#### Setup Nginx as Reverse Proxy
```bash
sudo yum install nginx -y
sudo nano /etc/nginx/conf.d/portfolio.conf
```

#### Nginx Configuration
```nginx
upstream portfolio {
    server 127.0.0.1:5000;
}

server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://portfolio;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

#### Test and Reload Nginx
```bash
sudo nginx -t
sudo systemctl reload nginx
```

### Option 7: Deploy on Google Cloud Platform

#### Create GCP Project
1. Go to https://console.cloud.google.com
2. Create a new project
3. Enable Cloud Run

#### Deploy to Cloud Run
```bash
gcloud auth login
gcloud config set project your-project-id

cd backend/python

# Build Docker image
docker build -t gcr.io/your-project/techvision-portfolio .

# Push to Container Registry
docker push gcr.io/your-project/techvision-portfolio

# Deploy to Cloud Run
gcloud run deploy techvision-portfolio \
  --image gcr.io/your-project/techvision-portfolio \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated
```

### Option 8: Deploy on Azure

#### Deploy to Azure App Service
```bash
# Login to Azure
az login

# Create App Service
az appservice create \
  --name techvision-portfolio \
  --resource-group myResourceGroup \
  --runtime "PYTHON:3.11" \
  --sku B1

# Deploy code
az webapp up \
  --name techvision-portfolio \
  --resource-group myResourceGroup
```

### Option 9: Deploy on DigitalOcean

#### Create Droplet
1. Go to https://digitalocean.com
2. Create a new droplet
3. Choose Ubuntu 22.04
4. Add Python and Nginx droplet letsencrypt

#### Connect and Setup
```bash
ssh root@your-droplet-ip

# Install dependencies
sudo apt update
sudo apt install -y python3-pip nginx git

# Clone repository
git clone your-repo-url /var/www/portfolio
cd /var/www/portfolio

# Setup virtual environment and run
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Create systemd service and nginx config
# (Similar to AWS EC2 setup above)
```

## Environment Variables

Create a `.env` file for production:

```env
# Server
FLASK_ENV=production
FLASK_DEBUG=false

# Database (if using)
DATABASE_URL=postgresql://user:password@localhost/portfolio

# CORS
CORS_ORIGINS=https://yourdomain.com

# Email (if using for contact form)
EMAIL_SERVER=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your-email@gmail.com
EMAIL_PASSWORD=your-app-password
```

## SSL/HTTPS Setup

### Using Let's Encrypt (Certbot)

```bash
sudo apt install certbot python3-certbot-nginx

sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
```

### Using Nginx Proxy Manager

1. Deploy Nginx Proxy Manager on a separate server
2. Configure reverse proxy to your application server
3. Get SSL certificates through the UI

## Monitoring and Logging

### Setup Logging

Create `backend/python/logs/` directory:
```bash
mkdir -p backend/python/logs
```

Update `app.py` to include logging:
```python
import logging

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('logs/app.log'),
        logging.StreamHandler()
    ]
)

logger = logging.getLogger(__name__)
```

### Setup Health Check Endpoint

Add to `app.py`:
```python
@app.route('/health')
def health():
    return jsonify({
        "status": "healthy",
        "timestamp": datetime.now().isoformat(),
        "version": "1.0.0"
    })
```

## Performance Optimization

### Enable Gzip Compression
Add to Nginx config:
```nginx
gzip on;
gzip_vary on;
gzip_min_length 1024;
gzip_types text/plain text/css application/json application/javascript text/xml application/xml;
```

### Enable Browser Caching
Add to Nginx config:
```nginx
location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff|woff2)$ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}
```

### Optimize Three.js Assets
- Compress textures
- Use sprite atlases
- Implement level of detail (LOD)

## Security Best Practices

### 1. Enable HTTPS
- Use Let's Encrypt or similar
- Redirect HTTP to HTTPS

### 2. Set Security Headers
Add to Nginx config:
```nginx
add_header X-Frame-Options "SAMEORIGIN";
add_header X-Content-Type-Options "nosniff";
add_header X-XSS-Protection "1; mode=block";
add_header Referrer-Policy "strict-origin-when-cross-origin";
```

### 3. Rate Limiting
Add to Nginx config:
```nginx
limit_req_zone $binary_remote_addr zone=one:10m rate=10r/s;
limit_req zone=one burst=20 nodelay;
```

### 4. CORS Configuration
Update Flask app:
```python
from flask_cors import CORS

app = Flask(__name__)
CORS(app, resources={
    r"/*": {
        "origins": ["https://yourdomain.com"],
        "methods": ["GET", "POST", "OPTIONS"],
        "allow_headers": ["Content-Type"]
    }
})
```

## Backup Strategy

### Database Backup (if applicable)
```bash
# For H2 database
cp portfolio.mv.db backup/portfolio-$(date +%Y%m%d).mv.db
```

### File Backup
```bash
# Backup static files
tar -czf backup/static-$(date +%Y%m%d).tar.gz static/
```

## Monitoring Tools

### Setup Uptime Monitoring
- Uptime Robot
- Pingdom
- Statuspage

### Setup Error Tracking
- Sentry
- LogRocket
- Bugsnag

### Setup Analytics
- Google Analytics
- Mixpanel
- Amplitude

## Post-Deployment Checklist

- [ ] Test all scenes load correctly
- [ ] Verify 3D graphics render properly
- [ ] Test contact form submission
- [ ] Check API endpoints respond
- [ ] Verify SSL certificate is valid
- [ ] Test on different browsers
- [ ] Check mobile responsiveness
- [ ] Verify analytics are tracking
- [ ] Test performance with Lighthouse

## Support and Maintenance

### Regular Updates
- Update dependencies monthly
- Review and update security patches
- Monitor error logs

### Performance Monitoring
- Check page load times
- Monitor 3D performance
- Track user interactions

### User Feedback
- Implement feedback form
- Monitor user analytics
- Gather user testimonials

---

**Your 3D Portfolio is now production-ready!** 🚀
