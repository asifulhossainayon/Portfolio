# Contributing to TechVision Portfolio

Thank you for your interest in contributing to the TechVision Portfolio project! This document provides guidelines and instructions for contributing.

## 🎯 Ways to Contribute

### Bug Reports
Found a bug? Please [submit an issue](#submitting-an-issue) with:
- Description of the bug
- Steps to reproduce
- Expected vs actual behavior
- Browser/OS information
- Screenshots if applicable

### Feature Requests
Have an idea for a new feature? [Create an issue](#submitting-an-issue) with:
- Feature description
- Use case
- Proposed implementation approach
- Any relevant examples

### Code Contributions
Want to fix a bug or add a feature? See [Contributing Code](#contributing-code) below.

### Documentation
Improve documentation, add examples, or write tutorials.

### Design
Suggest UI/UX improvements, color scheme changes, or new visual elements.

## 📋 Code of Conduct

Please note that this project is released with a [Code of Conduct](#code-of-conduct). By participating, you agree to abide by its terms.

## 🛠️ Getting Started

### Prerequisites

- Python 3.8+
- Java 17+ (for Java backend)
- Node.js 16+ (optional, for build tools)
- Git
- Modern web browser with WebGL support

### Setup

1. **Fork the repository**
2. **Clone your fork:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/portfolio-3d.git
   cd portfolio-3d
   ```

3. **Create a branch:**
   ```bash
   git checkout -b feature/your-feature-name
   ```

4. **Install dependencies:**
   ```bash
   # Python backend
   cd backend/python
   pip install -r requirements.txt
   
   # Java backend (optional)
   cd ../java
   mvn clean install
   ```

## 📝 Contributing Code

### Code Style

#### Python
- Use 4 spaces for indentation
- Follow PEP 8 style guide
- Use type hints where appropriate
- Add docstrings for functions and classes
- Use f-strings for formatting

Example:
```python
def get_projects() -> List[Project]:
    """
    Get all projects from the portfolio.
    
    Returns:
        List[Project]: List of project objects
    """
    return PROJECTS
```

#### Java
- Use 4 spaces for indentation
- Follow Google Java Style Guide
- Use Java 8+ features (streams, lambdas)
- Add JavaDoc comments
- Use meaningful variable names

Example:
```java
/**
 * Get all projects from the portfolio.
 *
 * @return List of project objects
 */
public List<Project> getProjects() {
    return PROJECTS;
}
```

#### JavaScript
- Use ES6+ syntax
- Use const/let instead of var
- Follow Airbnb JavaScript Style Guide
- Add JSDoc comments for functions
- Use arrow functions

Example:
```javascript
/**
 * Get target camera position for current scene.
 * @returns {THREE.Vector3} Target position
 */
function getTargetCameraPosition() {
    switch (currentScene) {
        case 'reception':
            return new THREE.Vector3(0, 0, 8);
        // ...
    }
}
```

### Commit Messages

Use conventional commits format:

```
feat: Add new feature
fix: Fix bug in contact form
docs: Update README
style: Format code
refactor: Improve code structure
test: Add tests for X
chore: Update dependencies
```

### Pull Request Process

1. **Update documentation** as needed
2. **Test your changes** thoroughly
3. **Commit your changes** with clear messages
4. **Push to your fork**
5. **Create a pull request**

### Pull Request Guidelines

- Keep pull requests focused on a single change
- Write clear, descriptive commit messages
- Update documentation for new features
- Add tests for new functionality
- Ensure all tests pass
- Link related issues

## 🧪 Testing

### Python Tests

Create tests in `backend/python/tests/`:

```python
# tests/test_app.py
import pytest
from app import app, PORTFOLIO_DATA

def test_get_projects():
    projects = PORTFOLIO_DATA['projects']
    assert len(projects) > 0
    assert 'title' in projects[0]

def test_get_ceo():
    ceo = PORTFOLIO_DATA['ceo']
    assert ceo['name'] == 'Dr. Sarah Mitchell'
```

Run tests:
```bash
cd backend/python
pip install pytest
pytest
```

### Java Tests

Create tests in `backend/java/src/test/java/`:

```java
// src/test/java/com/portfolio/PortfolioServiceTest.java
package com.portfolio;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class PortfolioServiceTest {

    @Test
    void testGetProjects() {
        List<Project> projects = portfolioService.getProjects();
        assertNotNull(projects);
        assertTrue(projects.size() > 0);
    }
}
```

Run tests:
```bash
cd backend/java
mvn test
```

### Frontend Tests

Consider adding Jest tests for JavaScript:

```javascript
// tests/main.test.js
import { getTargetCameraPosition } from '../static/js/main';

describe('getTargetCameraPosition', () => {
    it('should return correct position for reception', () => {
        currentScene = 'reception';
        const position = getTargetCameraPosition();
        expect(position.x).toBe(0);
        expect(position.y).toBe(0);
        expect(position.z).toBe(8);
    });
});
```

Run tests:
```bash
npm test
```

## 📚 Documentation

### Updating README

When adding new features, update the README:

1. Add feature to the Features section
2. Update the project structure if needed
3. Add usage examples
4. Update the API documentation if needed

### Adding Examples

Create example files in appropriate directories:

- `examples/` - Usage examples
- `tutorials/` - Step-by-step guides
- `snippets/` - Code snippets

## 🎨 Design Contributions

### UI/UX Improvements

1. Create mockups in Figma or similar
2. Document the proposed changes
3. Explain the user benefit
4. Provide before/after comparisons

### Color Scheme Changes

When proposing color changes:

1. Provide color palette
2. Explain the rationale
3. Show accessibility considerations
4. Include contrast ratios

## 🔍 Code Review

### Reviewing Pull Requests

When reviewing PRs:

1. Check code style consistency
2. Verify functionality
3. Review test coverage
4. Check documentation updates
5. Consider performance impact
6. Look for potential bugs

### Common Review Checklist

- [ ] Code follows style guide
- [ ] Tests are included
- [ ] Documentation is updated
- [ ] No console errors
- [ ] Performance is acceptable
- [ ] Accessibility considerations
- [ ] Security considerations

## 🐛 Reporting Bugs

### Bug Report Template

```markdown
**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '...'
3. Scroll down to '...'
4. See error

**Expected behavior**
A clear and concise description of what you expected to happen.

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Desktop (please complete the following information):**
- OS: [e.g. iOS]
- Browser [e.g. chrome, safari]
- Version [e.g. 22]

**Additional context**
Add any other context about the problem here.
```

## 💡 Suggesting Features

### Feature Request Template

```markdown
**Feature Description**
A clear and concise description of what the feature is.

**Use Case**
Why is this feature needed? Who will use it?

**Implementation Approach**
How would you implement this feature?

**Alternatives Considered**
Have you considered other solutions?

**Additional Context**
Add any other context, screenshots, or examples here.
```

## 🌐 Internationalization

### Adding Translations

1. Create translation files in `locales/`:
   - `en.json` - English (default)
   - `es.json` - Spanish
   - `fr.json` - French
   - etc.

2. Use i18n functions in JavaScript:
```javascript
import translations from '../locales/en.json';

const welcomeText = translations.reception.welcome;
```

## 📦 Building and Packaging

### Python Package

```bash
cd backend/python
pip install build
python -m build
```

### Java Package

```bash
cd backend/java
mvn clean package
```

### Docker Image

```bash
docker build -t techvision-portfolio .
docker push your-registry/techvision-portfolio
```

## 🚀 Deployment

### Environment Variables

Create `.env` file for production:

```env
FLASK_ENV=production
FLASK_DEBUG=false
DATABASE_URL=postgresql://user:password@localhost/portfolio
CORS_ORIGINS=https://yourdomain.com
```

### Production Checklist

- [ ] Update environment variables
- [ ] Disable debug mode
- [ ] Enable HTTPS
- [ ] Configure CORS
- [ ] Set up logging
- [ ] Configure monitoring
- [ ] Test all features
- [ ] Check performance

## 📜 Code of Conduct

### Our Pledge

In the interest of fostering an open and welcoming environment, we as contributors and maintainers pledge to making participation in our project and our community a harassment-free experience for everyone.

### Our Standards

- **Be respectful**: Consider how others feel
- **Be empathetic**: Listen and understand
- **Be constructive**: Focus on the issue, not the person
- **Be inclusive**: Welcome everyone

### Our Responsibilities

Project maintainers are responsible for clarifying the standards of behavior and making judgments in best interest of the community.

## 🏆 Recognition

Contributors will be:
- Listed in the CONTRIBUTORS file
- Mentioned in release notes
- Recognized in community channels

## 📧 Contact

- **Project Issues**: [GitHub Issues](https://github.com/your-repo/issues)
- **Email**: your-email@example.com
- **Slack**: #portfolio-channel

## 🙏 Thank You!

Thank you for contributing to TechVision Portfolio! Your contributions make this project better for everyone.

---

**Questions?** Open an issue or reach out to the maintainers.
