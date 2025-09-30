# TrueVerse 📰

<div align="center">

![TrueVerse Logo](https://via.placeholder.com/200x200/4A90E2/ffffff?text=TrueVerse)

### Stay Informed, Stay True

A modern, feature-rich news application built with Flutter that delivers real-time news from around the world.

[![Flutter Version](https://img.shields.io/badge/Flutter-3.0+-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-3.0+-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge)](https://github.com/SatishParmar1/TrueVerse--NewsApp/pulls)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg?style=for-the-badge)](https://github.com/SatishParmar1/TrueVerse--NewsApp/graphs/commit-activity)

[Features](#-features) • [Architecture](#-architecture) • [Getting Started](#-getting-started) • [Screenshots](#-screenshots) • [Contributing](#-contributing)

</div>

---

## ✨ Features

<table>
<tr>
<td>

- 📱 **Cross-Platform Support**
  - iOS & Android compatibility
  - Responsive design
  
- 🔐 **Social Authentication**
  - Google Sign-In
  - Facebook Login
  - Apple Sign-In
  
- 🗞️ **Real-Time News**
  - Powered by News API
  - Multiple categories
  - Search functionality

</td>
<td>

- 💾 **Smart Storage**
  - Offline reading with SQLite
  - SharedPreferences for settings
  - Efficient caching
  
- 🎨 **Beautiful UI**
  - Custom Google Fonts
  - SVG icon support
  - Smooth animations
  
- 📍 **Location-Based**
  - Local news
  - Geo-targeted content

</td>
</tr>
</table>

### Additional Features

🔄 **Share Articles** • 📅 **Date Filtering** • 🛡️ **Screen Protection** • 🔥 **Firebase Integration** • 📊 **Version Management** • 📸 **Image Support**

## 🏗️ Architecture

<div align="center">

```mermaid
graph TB
    A[View Layer] -->|User Actions| B[ViewModel/BLoC]
    B -->|State Updates| A
    B -->|Data Requests| C[Repository]
    C -->|API Calls| D[News API]
    C -->|Local Storage| E[SQLite + SharedPreferences]
    D -->|JSON Response| C
    E -->|Cached Data| C
    C -->|Processed Data| B
    
    style A fill:#4A90E2,stroke:#333,stroke-width:2px,color:#fff
    style B fill:#50C878,stroke:#333,stroke-width:2px,color:#fff
    style C fill:#FFB347,stroke:#333,stroke-width:2px,color:#fff
    style D fill:#E74C3C,stroke:#333,stroke-width:2px,color:#fff
    style E fill:#9B59B6,stroke:#333,stroke-width:2px,color:#fff
```

**MVVM (Model-View-ViewModel) + BLoC Pattern**

</div>

### Project Structure

```
lib/
├── 📁 models/           # Data models and entities
├── 📁 views/            # UI screens and widgets
├── 📁 viewmodels/       # Business logic layer
├── 📁 blocs/            # BLoC state management
│   ├── events/          # BLoC events
│   ├── states/          # BLoC states
│   └── blocs/           # BLoC implementations
├── 📁 repositories/     # Data layer abstraction
├── 📁 services/         # API and local services
│   ├── api/             # News API service
│   ├── database/        # SQLite service
│   └── auth/            # Authentication services
├── 📁 utils/            # Helper functions and constants
└── 📁 widgets/          # Reusable UI components
```

## 📦 Tech Stack & Dependencies

<div align="center">

### Core Technologies

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![SQLite](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white)

</div>

### 📚 Package Categories

<details>
<summary><b>State Management & Architecture</b></summary>

- `flutter_bloc: ^9.1.1` - BLoC pattern implementation
- `dio: ^5.9.0` - Powerful HTTP client

</details>

<details>
<summary><b>Local Storage</b></summary>

- `sqflite: ^2.4.2` - Local SQLite database
- `shared_preferences: ^2.5.3` - Key-value storage
- `path: ^1.9.1` - File path utilities

</details>

<details>
<summary><b>UI & Animations</b></summary>

- `shimmer_animation: ^2.2.2` - Loading placeholders
- `flutter_svg: ^2.2.0` - SVG rendering
- `google_fonts: ^6.2.1` - Custom typography
- `calendar_date_picker2: ^2.0.1` - Date selection
- `syncfusion_flutter_datepicker: ^31.1.19` - Advanced date picker

</details>

<details>
<summary><b>Firebase Services</b></summary>

- `firebase_remote_config: ^5.4.4` - Remote configuration
- `firebase_crashlytics: ^4.3.7` - Crash reporting

</details>

<details>
<summary><b>Features & Utilities</b></summary>

- `share_plus: ^11.0.0` - Share functionality
- `geolocator: ^14.0.2` - Location services
- `url_launcher: ^6.3.1` - Open external links
- `image_picker: ^1.1.2` - Image selection
- `screen_protector: ^1.4.2+1` - Screen security
- `package_info_plus: ^8.3.0` - App information
- `version: ^3.0.2` - Version management

</details>

## 🚀 Getting Started

### Prerequisites

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart&logoColor=white)
![Android Studio](https://img.shields.io/badge/Android%20Studio-3DDC84?logo=android-studio&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-147EFB?logo=xcode&logoColor=white)

### Installation Steps

1️⃣ **Clone the repository**
```bash
git clone [https://github.com/SatishParmar1/TrueVerse--NewsApp.git]
cd trueverse
```

2️⃣ **Install dependencies**
```bash
flutter pub get
```

3️⃣ **Configure API keys**

Create a `.env` file in the root directory:
```env
NEWS_API_KEY=your_news_api_key_here
```

4️⃣ **Set up Firebase**
- Download `google-services.json` for Android
- Download `GoogleService-Info.plist` for iOS
- Place them in respective directories
- Follow [Firebase setup guide](https://firebase.google.com/docs/flutter/setup)

5️⃣ **Run the app**
```bash
flutter run
```

## 🔧 Configuration

### 🗞️ News API Setup

1. Visit [newsapi.org](https://newsapi.org)
2. Sign up for a free account
3. Get your API key
4. Add it to your `.env` file

### 🔐 Social Authentication Setup

<table>
<tr>
<th>Provider</th>
<th>Setup Link</th>
<th>Required</th>
</tr>
<tr>
<td>
  <img src="https://img.shields.io/badge/Google-4285F4?style=flat&logo=google&logoColor=white" alt="Google"/>
</td>
<td>
  <a href="https://console.cloud.google.com">Google Cloud Console</a>
</td>
<td>OAuth 2.0 Client ID</td>
</tr>
<tr>
<td>
  <img src="https://img.shields.io/badge/Facebook-1877F2?style=flat&logo=facebook&logoColor=white" alt="Facebook"/>
</td>
<td>
  <a href="https://developers.facebook.com">Facebook Developers</a>
</td>
<td>App ID & Secret</td>
</tr>
<tr>
<td>
  <img src="https://img.shields.io/badge/Apple-000000?style=flat&logo=apple&logoColor=white" alt="Apple"/>
</td>
<td>
  <a href="https://developer.apple.com">Apple Developer</a>
</td>
<td>Service ID</td>
</tr>
</table>

## 📱 Screenshots

<div align="center">

### Coming Soon! 🎨

<table>
<tr>
<td align="center">
<img src="https://via.placeholder.com/250x500/4A90E2/ffffff?text=Home+Screen" alt="Home Screen" width="200"/>
<br />
<b>Home Screen</b>
</td>
<td align="center">
<img src="https://via.placeholder.com/250x500/50C878/ffffff?text=News+Detail" alt="News Detail" width="200"/>
<br />
<b>Article Detail</b>
</td>
<td align="center">
<img src="https://via.placeholder.com/250x500/FFB347/ffffff?text=Categories" alt="Categories" width="200"/>
<br />
<b>Categories</b>
</td>
<td align="center">
<img src="https://via.placeholder.com/250x500/E74C3C/ffffff?text=Profile" alt="Profile" width="200"/>
<br />
<b>User Profile</b>
</td>
</tr>
</table>

</div>

## 🎯 Roadmap

<div align="center">

### Development Progress

</div>

- [x] 🏗️ MVVM architecture with BLoC
- [x] 📰 News API integration
- [x] 💾 Local storage (SQLite + SharedPreferences)
- [x] 🎨 UI components and animations
- [x] 📍 Location-based services
- [x] 🔥 Firebase integration
- [ ] 🔐 Google Authentication
- [ ] 📘 Facebook Authentication
- [ ] 🍎 Apple Authentication
- [ ] 🌙 Dark mode support
- [ ] 🔖 Bookmark functionality
- [ ] 🔔 Push notifications
- [ ] 🌍 Multi-language support
- [ ] 📊 Analytics dashboard
- [ ] 🎙️ Audio news feature

## 🤝 Contributing

<div align="center">

**Contributions are what make the open source community amazing!** 

[![Contributors](https://img.shields.io/github/contributors/SatishParmar1/TrueVerse--NewsApp?style=for-the-badge)](https://github.com/SatishParmar1/TrueVerse--NewsApp/graphs/contributors)
[![Forks](https://img.shields.io/github/forks/SatishParmar1/TrueVerse--NewsApp?style=for-the-badge)](https://github.com/SatishParmar1/TrueVerse--NewsApp/network/members)
[![Stargazers](https://img.shields.io/github/stars/SatishParmar1/TrueVerse--NewsApp?style=for-the-badge)](https://github.com/SatishParmar1/TrueVerse--NewsApp/stargazers)
[![Issues](https://img.shields.io/github/issues/SatishParmar1/TrueVerse--NewsApp?style=for-the-badge)](https://github.com/SatishParmar1/TrueVerse--NewsApp/issues)

</div>

### How to Contribute

1. 🍴 Fork the Project
2. 🔨 Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. ✅ Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. 📤 Push to the Branch (`git push origin feature/AmazingFeature`)
5. 🎉 Open a Pull Request

### Code Style

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Write meaningful commit messages
- Add comments for complex logic
- Write tests for new features


## 👨‍💻 Author

<div align="center">

**Your Name**

[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/SatishParmar1)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/satish-parmar-ak978312)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:satishparmarparmar486@gmail.com)

</div>

## 🙏 Acknowledgments

<div align="center">

Special thanks to:

- [News API](https://newsapi.org) for providing free news data
- [Flutter Team](https://flutter.dev) for the amazing framework
- [BLoC Library](https://bloclibrary.dev/) for state management
- All the open-source contributors
- The amazing Flutter community

</div>

---

<div align="center">

### 📊 Project Stats

![GitHub repo size](https://img.shields.io/github/repo-size/SatishParmar1/TrueVerse--NewsApp?style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/SatishParmar1/TrueVerse--NewsApp?style=for-the-badge)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/SatishParmar1/TrueVerse--NewsApp?style=for-the-badge)

**Made with ❤️ using Flutter**

⭐ **Star this repo if you find it useful!** ⭐

![Profile Views](https://komarev.com/ghpvc/?username=SatishParmar1&color=blueviolet&style=for-the-badge)

**Status**: 🔄 Actively Maintained & Continuously Updated

</div>






