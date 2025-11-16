# Abhyas — Offline Learning Platform

<div align="center">

**A modern, AI-powered offline-first Flutter mobile application for students in grades 6-12**

[Quick Start](#quick-start) • [Features](#features) • [Architecture](#architecture) • [Development](#development)

</div>

---

## Overview

Abhyas is a mobile application built with Flutter/Dart designed for offline learning. It provides:

- **Subject & Lesson Management**: Browse 4 core subjects (Science, Math, History, English) with comprehensive lesson content
- **Interactive Reading Experience**: Built-in lesson reader with content type support (text, video, image)
- **AI-Powered Summarization**: Optional Google Gemini API integration for intelligent text summarization
- **Quiz System**: 10-question quizzes with instant feedback to reinforce learning
- **Progress Tracking**: Dashboard to monitor learning progress and quiz attempts
- **AI Study Assistant**: Chat interface for personalized learning support
- **Offline-First Design**: Core functionality works offline; AI features gracefully degrade
- **Dark Theme**: Comfortable learning experience with modern UI design

---

## Features

### 📚 Core Functionality
- **4 Subject Categories**: Science (🧪), Mathematics (📐), History (📚), English (📖)
- **20+ Comprehensive Lessons**: 5 lessons per subject with detailed content
- **100+ Quiz Questions**: 10 questions per lesson for knowledge reinforcement
- **Hierarchical Navigation**: Subject → Lesson List → Lesson → Quiz flow
- **Progress Tracking**: View all quiz attempts with color-coded scores

### 🎨 UI/UX
- **Dark Theme**: Eye-friendly interface with cyan/blue accents
- **Gradient Cards**: Subject cards with vibrant, subject-specific gradients
- **Smooth Animations**: Scale effects, transitions, and loading indicators
- **Bottom Navigation**: 4 persistent tabs (Home, Progress, AI Friend, Settings)
- **Responsive Design**: Optimized for various screen sizes

### 🤖 AI Integration
- **Lesson Summarization**: Generate concise 5-10 sentence summaries
- **AI Study Assistant**: Interactive chat for learning support
- **Gemini API**: Uses `gemini-2.0-flash-exp` model
- **Graceful Degradation**: Works offline when API unavailable

---

## Tech Stack

| Layer               | Technology                |
| ------------------- | ------------------------- |
| **Framework**       | Flutter 3.x              |
| **Language**        | Dart 3.x                 |
| **State Management**| Provider                 |
| **AI/ML**           | Google Gemini API        |
| **HTTP Client**     | http package             |
| **Date Formatting** | intl package             |

---

## Project Structure

```
abhyas_offline_learning/
├── lib/
│   ├── main.dart                  # App entry point
│   ├── models/                    # Data models
│   │   ├── subject.dart
│   │   ├── lesson.dart
│   │   ├── question.dart
│   │   └── quiz_attempt.dart
│   ├── services/                  # Business logic & API
│   │   └── gemini_service.dart
│   ├── utils/                     # Utilities & helpers
│   │   ├── app_state.dart         # Global state management
│   │   ├── theme.dart             # Theme configuration
│   │   └── mock_data.dart         # Sample data
│   ├── views/                     # Screen components
│   │   ├── home_view.dart
│   │   ├── lesson_list_view.dart
│   │   ├── lesson_view.dart
│   │   ├── quiz_view.dart
│   │   ├── progress_view.dart
│   │   ├── ai_friend_view.dart
│   │   └── settings_view.dart
│   └── widgets/                   # Reusable components
│       ├── bottom_nav.dart
│       └── subject_card.dart
├── android/                       # Android-specific files
├── ios/                          # iOS-specific files
├── test/                         # Unit tests
├── pubspec.yaml                  # Dependencies
├── analysis_options.yaml         # Lint rules
└── README.md                     # This file
```

---

## Quick Start

### Prerequisites

- **Flutter SDK** 3.2.0 or higher ([Install Flutter](https://flutter.dev/docs/get-started/install))
- **Dart SDK** 3.2.0 or higher (included with Flutter)
- **Android Studio** / **Xcode** for running on simulators
- **Google Gemini API Key** (optional, for AI features) - Get it from [Google AI Studio](https://aistudio.google.com/)

### Installation & Setup

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd abhyas-offline-learning
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Configure API Key** (optional for AI features)
   
   Create a `.env` file or configure the API key via command line:

   ```bash
   # Option 1: Set environment variable
   export GEMINI_API_KEY=your_api_key_here

   # Option 2: Pass during run
   flutter run --dart-define=GEMINI_API_KEY=your_api_key_here
   ```

4. **Run the app**

   ```bash
   # Run on connected device/emulator
   flutter run

   # Run in release mode
   flutter run --release

   # Run on specific device
   flutter devices
   flutter run -d <device_id>
   ```

5. **Build for production**

   ```bash
   # Build APK (Android)
   flutter build apk --release

   # Build App Bundle (Android)
   flutter build appbundle --release

   # Build IPA (iOS)
   flutter build ios --release
   ```

---

## Architecture

### State Management

The app uses **Provider** for state management:

- **Global State** (`AppState`): Subject/lesson selection, quiz attempts, theme, sync status
- **Local State**: Component-level state for UI interactions and animations
- **Reactive Updates**: UI automatically updates when state changes

### Navigation Flow

```
Home → Select Subject → Lesson List → Select Lesson → Lesson View
                                                    ↓
                                        Take Quiz → Quiz View → Results
                                                    ↓
                                        Progress View (shows all attempts)
```

### Component Hierarchy

```
MaterialApp (Provider)
└── MainScreen
    ├── BottomNav (4 tabs)
    └── Dynamic Body
        ├── HomeView
        ├── LessonListView
        ├── LessonView
        ├── QuizView
        ├── ProgressView
        ├── AiFriendView
        └── SettingsView
```

---

## Development

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### Code Analysis

```bash
# Analyze code
flutter analyze

# Format code
flutter format .
```

### Adding New Content

#### 1. Add a New Lesson

Edit `lib/utils/mock_data.dart`:

```dart
const Lesson(
  id: 'new_lesson_id',
  title: 'New Lesson Title',
  subjectId: 'science', // or 'math', 'history', 'english'
  content: '''Your lesson content here...''',
  contentTypes: ['text', 'video', 'image'],
  downloadStatus: 100,
),
```

#### 2. Add Quiz Questions

Add 10 questions per lesson in `mock_data.dart`:

```dart
const Question(
  id: 'q_new_lesson_id_1',
  lessonId: 'new_lesson_id',
  questionText: 'What is...?',
  options: ['Option A', 'Option B', 'Option C', 'Option D'],
  correctAnswerIndex: 0, // 0-3 for A-D
),
```

### Customizing Themes

Edit `lib/utils/theme.dart` to modify colors and styles:

```dart
static const Color cyanAccent = Color(0xFF06B6D4);
static const Color darkBackground = Color(0xFF0A0F1F);
```

---

## Environment Variables

| Variable         | Required | Purpose                        | Default |
| ---------------- | -------- | ------------------------------ | ------- |
| `GEMINI_API_KEY` | No       | Google Gemini API key for AI   | ''      |

**Setting via command line:**

```bash
flutter run --dart-define=GEMINI_API_KEY=your_key_here
```

---

## API Integration

### Google Gemini API

**Service**: `lib/services/gemini_service.dart`

#### Key Methods

**`summarizeText(String text): Future<String>`**
- Generates student-friendly 5-10 sentence summaries
- Uses temperature 0.7 for balanced creativity/accuracy

**`getChatResponse(String message): Future<String>`**
- Provides conversational AI assistance
- Context-aware responses for students grades 6-12

**`isAvailable(): bool`**
- Checks if API key is configured
- Returns `false` when offline/key missing

---

## Mock Data

The app includes comprehensive sample data:

- **4 Subjects**: Each with custom emoji icon and gradient colors
- **20 Lessons**: 5 per subject with 500-1000 word content
- **200+ Questions**: 10 questions per lesson
- **5 Sample Quiz Attempts**: Pre-populated progress data

All mock data is located in `lib/utils/mock_data.dart`.

---

## Building for Production

### Android

```bash
# Generate release APK
flutter build apk --release

# Generate App Bundle (preferred for Play Store)
flutter build appbundle --release

# Output location:
# build/app/outputs/flutter-apk/app-release.apk
# build/app/outputs/bundle/release/app-release.aab
```

### iOS

```bash
# Build iOS release
flutter build ios --release

# Open in Xcode for signing and deployment
open ios/Runner.xcworkspace
```

---

## Common Issues & Troubleshooting

| Issue                                  | Solution                                                      |
| -------------------------------------- | ------------------------------------------------------------- |
| Flutter not recognized                 | Add Flutter to PATH: `export PATH="$PATH:`pwd`/flutter/bin"` |
| API key not working                    | Verify key in Gemini AI Studio and check network connection  |
| Build errors on iOS                    | Run `pod install` in `ios/` directory                         |
| Gradle sync fails (Android)            | Update Android Studio, check `local.properties`               |
| Hot reload not working                 | Stop and restart with `flutter run`                           |
| Permission errors (Android)            | Add `<uses-permission>` in AndroidManifest.xml                |

---

## Performance Considerations

- **Lazy Loading**: Questions loaded per lesson, not all at once
- **Efficient Rendering**: Use const constructors where possible
- **Image Optimization**: Consider cached_network_image for remote content
- **State Management**: Provider minimizes unnecessary rebuilds
- **API Calls**: Debounced and cached where appropriate

---

## Future Enhancements

- [ ] Local database (SQLite/Hive) for persistence
- [ ] Video player integration for lesson videos
- [ ] Image viewer for lesson images
- [ ] User authentication & cloud sync
- [ ] Push notifications for reminders
- [ ] Multi-language support
- [ ] Accessibility improvements (screen reader support)
- [ ] Light theme option
- [ ] Export progress as PDF
- [ ] Social sharing of achievements
- [ ] Gamification (badges, streaks, leaderboards)

---

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Make changes and commit: `git commit -m "Add new feature"`
4. Push to branch: `git push origin feature/my-feature`
5. Open a Pull Request

**Code Style**: Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines.

---

## License

MIT License — feel free to use for personal or commercial projects.

---

## Support & Documentation

- **Flutter Docs**: https://flutter.dev/docs
- **Dart Docs**: https://dart.dev/guides
- **Provider Package**: https://pub.dev/packages/provider
- **Google Gemini API**: https://ai.google.dev/docs
- **Material Design**: https://material.io/design

---

## Contact

For questions, suggestions, or bug reports, please open an issue on GitHub.

---

## Acknowledgments

- Flutter team for the amazing framework
- Google for Gemini API
- All contributors and testers

**Happy Learning! 📚✨**
