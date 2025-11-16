# Contributing to Abhyas: Offline Learning

Thank you for considering contributing to Abhyas! This document provides guidelines and instructions for contributing to the project.

## Getting Started

### Prerequisites

- Flutter SDK 3.2.0 or higher
- Dart SDK 3.2.0 or higher
- Git
- A code editor (VS Code, Android Studio, or IntelliJ IDEA recommended)

### Setting Up Development Environment

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/abhyas-offline-learning.git
   cd abhyas-offline-learning
   ```

3. Add upstream remote:
   ```bash
   git remote add upstream https://github.com/pranavsw/abhyas-offline-learning.git
   ```

4. Install dependencies:
   ```bash
   flutter pub get
   ```

5. Run the app:
   ```bash
   flutter run
   ```

## Development Workflow

### Branching Strategy

- `main` - Stable production code
- `develop` - Development branch
- `feature/*` - New features
- `bugfix/*` - Bug fixes
- `hotfix/*` - Urgent production fixes

### Making Changes

1. Create a new branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes following our coding standards

3. Test your changes:
   ```bash
   flutter test
   flutter analyze
   ```

4. Commit your changes:
   ```bash
   git add .
   git commit -m "Description of changes"
   ```

5. Push to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

6. Open a Pull Request on GitHub

## Coding Standards

### Dart Code Style

Follow the [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines:

- Use meaningful variable and function names
- Keep functions small and focused
- Add comments for complex logic
- Use const constructors when possible
- Prefer single quotes for strings

### File Organization

```
lib/
├── main.dart           # App entry point
├── models/             # Data models
├── services/           # Business logic & APIs
├── utils/              # Utilities & helpers
├── views/              # Screen components
└── widgets/            # Reusable UI components
```

### Widget Guidelines

- Use `const` constructors when widgets don't depend on runtime data
- Extract reusable widgets into separate files
- Keep widget build methods under 100 lines
- Use meaningful widget names

### State Management

- Use Provider for global state
- Keep state as local as possible
- Don't rebuild unnecessarily

## Testing

### Writing Tests

- Write unit tests for models and utilities
- Write widget tests for UI components
- Aim for >70% code coverage

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/models_test.dart

# Run with coverage
flutter test --coverage
```

## Adding New Features

### Adding a New Subject

1. Add subject to `lib/utils/mock_data.dart`:
   ```dart
   const Subject(
     id: 'new_subject',
     name: 'New Subject',
     icon: '🎨',
     gradientColors: [0xFF..., 0xFF...],
   )
   ```

2. Add lessons for the subject
3. Add questions for each lesson
4. Test thoroughly

### Adding a New View

1. Create file in `lib/views/`
2. Implement StatelessWidget or StatefulWidget
3. Add navigation logic in `main.dart`
4. Update bottom navigation if needed
5. Add tests

### Adding Dependencies

1. Add to `pubspec.yaml`
2. Run `flutter pub get`
3. Document usage in code
4. Update README if significant

## Pull Request Guidelines

### Before Submitting

- [ ] Code follows style guidelines
- [ ] All tests pass
- [ ] No analyzer warnings
- [ ] Documentation updated
- [ ] Commit messages are clear

### PR Description Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
How was this tested?

## Screenshots (if applicable)
Add screenshots for UI changes

## Checklist
- [ ] Code follows project style
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] No breaking changes (or documented)
```

## Code Review Process

1. Maintainers will review your PR
2. Address feedback and requested changes
3. Once approved, PR will be merged
4. Your contribution will be recognized

## Reporting Bugs

### Before Reporting

- Check if bug already reported
- Verify it's reproducible
- Collect relevant information

### Bug Report Template

```markdown
**Description**
Clear description of the bug

**To Reproduce**
Steps to reproduce:
1. Go to '...'
2. Click on '...'
3. See error

**Expected Behavior**
What should happen

**Screenshots**
If applicable

**Environment**
- Flutter version:
- Dart version:
- Device/Emulator:
- OS:

**Additional Context**
Any other relevant information
```

## Feature Requests

We welcome feature requests! Please:

1. Check if already requested
2. Provide clear use case
3. Explain expected behavior
4. Consider implementation complexity

## Community Guidelines

- Be respectful and inclusive
- Help others learn and grow
- Follow code of conduct
- Give constructive feedback
- Celebrate contributions

## Questions?

- Open an issue with "question" label
- Check existing discussions
- Read the documentation

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to Abhyas! 🎓✨
