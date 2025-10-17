# Flutter Portfolio - Amr Nabih

A professional portfolio web app built with Flutter Web, showcasing my skills, certifications, and projects.

## 🌐 Live Demo

Visit my portfolio: [https://amrnabih113.github.io/My-Portfolio/](https://amrnabih113.github.io/My-Portfolio/)

## 🚀 Features

- Responsive design for mobile, tablet, and desktop
- Modern midnight-tech themed UI with gradients and glassmorphism
- Interactive sections: Hero, About, Certifications (with clickable certificate links), Skills, Experience (with "View Code" buttons for each project), Contact
- Smooth scrolling navigation and active section highlighting
- Social media integration (LinkedIn, GitHub, etc.)
- External links to project repositories and certificates

## 🛠️ Technologies

- Flutter Web (3.24.0)
- Dart
- Material Design
- Custom animations
- url_launcher for external links

## 📦 Setup & Run Locally

### Prerequisites

- Flutter SDK (3.24.0 or higher)
- Dart SDK
- Chrome browser

### Installation

```bash
git clone https://github.com/amrnabih113/My-Portfolio.git
cd My-Portfolio
flutter pub get
flutter run -d chrome
flutter build web --release
```

## 📄 Deployment

Deployed to GitHub Pages using GitHub Actions.  
Manual deployment uses `git subtree` to push only the web build to the `gh-pages` branch.

```bash
flutter build web --release --base-href /My-Portfolio/
# Deploy build/web/ to gh-pages branch
```

## 🏆 Certifications

All certifications are displayed with clickable cards linking to their official certificates.

## 💼 Projects

Each project card in the Experience section includes a "View Code" button linking to its GitHub repository:

- FurFriends
- Knowva
- A-Store
- SmartFin

## 📧 Contact

Connect with me via LinkedIn or email (see portfolio contact section).

## 📝 License

© 2025 Amr Nabih. All rights reserved.

---

Crafted with Flutter & ❤️
