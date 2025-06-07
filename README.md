# 🔥 Flutter Watch Store UI Kit - 2025 Edition with Riverpod 🔥 ⌚️ 💫

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com) [![Twitter Follow](https://img.shields.io/twitter/follow/iam_olayemii.svg?style=social)](https://twitter.com/iam_olayemii)

![GitHub Repo stars](https://img.shields.io/github/stars/Erengun/flutter-watch-store-ui-kit-riverpod?style=social) ![GitHub watchers](https://img.shields.io/github/watchers/Erengun/flutter-watch-store-ui-kit-riverpod?style=social) ![GitHub](https://img.shields.io/github/license/Erengun/flutter-watch-store-ui-kit-riverpod)

## Modern Watch Store App with Riverpod Architecture

A beautiful, production-ready Flutter watch store app built with the latest packages and best practices, supporting Flutter 3.32 and above. This project combines stunning UI design with clean architecture principles and modern state management.

**Original UI Design Credit:** This app is based on the beautiful watch store UI kit originally created by [Olayemi Garuba](https://twitter.com/iam_olayemii). The original design has been modernized and updated for 2025 with null safety, latest Flutter features, and Riverpod state management.

---

### 🚀 Key Features

**UI & Design:**
- 🎨 Beautiful watch store interface with modern Material 3 design
- 📱 Responsive UI with adaptive widgets for all screen sizes
- ⌚️ Elegant product showcase and detailed watch views
- 🛒 Complete shopping cart and checkout flow
- 💳 Modern payment interface design

**Architecture & State Management:**
- 🏗️ Clean Architecture with Domain-Driven Design
- 🎯 Riverpod 2.6+ with code generation for type-safe state management
- 🔒 Built-in authentication system with secure storage (Hive CE + AES-256)
- 🌐 Type-safe API integration with Dio 5.8+
- 🌍 Internationalization ready with Easy Localization
- 💾 Secure local storage for user preferences and cart data
- 🧪 Pre-configured unit testing for business logic
- ⚡ Modern navigation with GoRouter 14.8+
- 🛠️ Custom linting and devtools configuration

---

## 📱 Screenshots

![Screenshot 1](https://res.cloudinary.com/olayemii/image/upload/v1611747047/assets/ss5_hy4cek.png) ![Screenshot 2](https://res.cloudinary.com/olayemii/image/upload/v1611747018/assets/ss6_zkqegd.png) ![Screenshot 3](https://res.cloudinary.com/olayemii/image/upload/v1611747017/assets/ss7_mkqegd.png)

![Main Page](https://res.cloudinary.com/olayemii/image/upload/v1611749056/assets/watch-1_y4mpof.png)

---

## 🛠️ Tech Stack

**Core Libraries:**
- State Management: Riverpod 2.6.1, Freezed 3.0.6 (immutable state)
- Network Layer: Dio 5.8.0, FPDart 1.1.0 for functional error handling
- Local Storage: Hive CE 2.11.1 with AES-256 encryption
- UI & Navigation: GoRouter 14.8.0, Google Fonts 6.2.1, Material 3

**Developer Tools:**
- Flutter Lints 5.0.0
- Build Runner, code generation
- Custom linting rules (`lint_rules.yaml`)
- Dart & Flutter DevTools support

---

## 📁 Project Structure

```
lib/
├── common/            # Shared widgets and components
├── config/            # App configuration (theme, colors)
├── constants/         # App-wide constants (endpoints, assets)
├── core/              # Core functionality, network layer
├── features/          # Feature modules
│   ├── authentication/    # Login, register, profile
│   ├── home/             # Main dashboard and watch catalog
│   ├── product/          # Product details and reviews
│   ├── cart/             # Shopping cart management
│   └── checkout/         # Payment and order processing
├── hive/              # Local storage setup and adapters
├── router/            # Navigation & routing configuration
├── utils/             # Utility functions and helpers
├── main.dart          # App entry point
└── my_app.dart        # App configuration and themes
```

---

## 🚀 Getting Started

### 💻 Requirements

- Any Operating System (MacOS, Linux, Windows)
- Any IDE with Flutter SDK installed (Android Studio, VSCode etc)
- Flutter 3.32 or above
- Dart 3.0 or above
- A little knowledge of Dart, Flutter, and Riverpod

### 🔧 Setup

1. **Clone the repository:**
    ```bash
    git clone https://github.com/Erengun/flutter-watch-store-ui-kit-riverpod.git
    cd flutter-watch-store-ui-kit-riverpod
    ```

2. **Install dependencies:**
    ```bash
    flutter pub get
    ```

3. **Generate code:**
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4. **Setup environment:**
    ```bash
    cp .env.example .env
    # Edit .env file with your API endpoints and configurations
    ```

5. **Run the app:**
    ```bash
    flutter run
    ```

---

## 🔐 Authentication Module

The app includes a complete authentication system with secure credential storage and error handling.

### How it works

- **Login & Registration:** Uses Dio to POST to `/api/login` and `/api/register` endpoints
- **Credential Caching:** Credentials are securely cached in Hive CE using AES-256 encryption
- **State Management:** All authentication UI and logic managed via Riverpod notifiers
- **Error Handling:** Network and validation errors are properly surfaced in the UI
- **Loading States:** Smooth UX with proper loading and error state management

**Example:**
```dart
@riverpod
class LoginController extends _$LoginController {
  Future<LoginResponse> login({required String email, required String password}) async {
    // Handles login, error handling, caching, loading state etc.
  }
}
```

---

## 🧪 Testing

- Integrated tests for authentication and business logic
- Run tests with:
    ```bash
    flutter test
    ```

---

## 🤝 Contributing

See our [Contributing Guide](CONTRIBUTING.md) for details on how to:
- Set up your development environment
- Run tests and code generation
- Submit pull requests
- Report issues

PRs are welcomed. Issues are welcomed too.

---

## 💖 Support

> ⭐️ Star the repo to show support. ⭐️

---

## 👨‍💻 Credits

**Original UI Design:** [Olayemi Garuba](https://twitter.com/iam_olayemii) - Creator of the original beautiful watch store UI kit

**2025 Modernization:** [Eren Gün](https://www.erengun.dev) - Updated with modern Flutter, Riverpod architecture, and null safety

**UI Kit Source:** Based on designs from UpLabs 💓

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📞 Contact

- **Project Maintainer:** [https://www.erengun.dev](https://www.erengun.dev)
- **Original Designer:** [Olayemi Garuba on Twitter](https://twitter.com/iam_olayemii)
- **UI Suggestions:** [info@flutterpanda.com](mailto:info@flutterpanda.com)
