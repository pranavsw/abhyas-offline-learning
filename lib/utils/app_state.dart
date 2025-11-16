import 'package:flutter/material.dart';
import '../models/subject.dart';
import '../models/lesson.dart';
import '../models/quiz_attempt.dart';
import '../utils/mock_data.dart';

class AppState extends ChangeNotifier {
  // Data
  final List<Subject> subjects = mockSubjects;
  final List<Lesson> lessons = mockLessons;
  final List<QuizAttempt> _quizAttempts = List.from(mockQuizAttempts);
  
  // Navigation state
  Subject? _selectedSubject;
  Lesson? _selectedLesson;
  bool _isDarkMode = true;
  DateTime? _lastSyncTime;

  // Getters
  Subject? get selectedSubject => _selectedSubject;
  Lesson? get selectedLesson => _selectedLesson;
  bool get isDarkMode => _isDarkMode;
  DateTime? get lastSyncTime => _lastSyncTime;
  List<QuizAttempt> get quizAttempts => List.unmodifiable(_quizAttempts);

  // Get lessons for a subject
  List<Lesson> getLessonsForSubject(String subjectId) {
    return lessons.where((lesson) => lesson.subjectId == subjectId).toList();
  }

  // Get quiz attempt for a lesson
  QuizAttempt? getQuizAttemptForLesson(String lessonId) {
    try {
      return _quizAttempts.firstWhere((attempt) => attempt.lessonId == lessonId);
    } catch (e) {
      return null;
    }
  }

  // Get all quiz attempts for a subject
  List<QuizAttempt> getQuizAttemptsForSubject(String subjectId) {
    final subjectLessonIds = getLessonsForSubject(subjectId)
        .map((lesson) => lesson.id)
        .toSet();
    
    return _quizAttempts
        .where((attempt) => subjectLessonIds.contains(attempt.lessonId))
        .toList();
  }

  // Navigation actions
  void selectSubject(Subject? subject) {
    _selectedSubject = subject;
    _selectedLesson = null;
    notifyListeners();
  }

  void selectLesson(Lesson? lesson) {
    _selectedLesson = lesson;
    notifyListeners();
  }

  void goBack() {
    if (_selectedLesson != null) {
      _selectedLesson = null;
    } else if (_selectedSubject != null) {
      _selectedSubject = null;
    }
    notifyListeners();
  }

  void resetNavigation() {
    _selectedSubject = null;
    _selectedLesson = null;
    notifyListeners();
  }

  // Theme actions
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  // Quiz actions
  void addQuizAttempt(QuizAttempt attempt) {
    _quizAttempts.insert(0, attempt);
    notifyListeners();
  }

  // Sync actions
  void triggerSync() {
    _lastSyncTime = DateTime.now();
    notifyListeners();
    // In a real app, this would trigger actual sync logic
  }

  // Get lesson by ID
  Lesson? getLessonById(String lessonId) {
    try {
      return lessons.firstWhere((lesson) => lesson.id == lessonId);
    } catch (e) {
      return null;
    }
  }
}
