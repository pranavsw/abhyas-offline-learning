import 'package:flutter_test/flutter_test.dart';
import 'package:abhyas_offline_learning/models/subject.dart';
import 'package:abhyas_offline_learning/models/lesson.dart';
import 'package:abhyas_offline_learning/models/question.dart';
import 'package:abhyas_offline_learning/models/quiz_attempt.dart';

void main() {
  group('Data Models Tests', () {
    test('Subject model should be created correctly', () {
      const subject = Subject(
        id: 'test_id',
        name: 'Test Subject',
        icon: '📚',
        gradientColors: [0xFF06B6D4, 0xFF3B82F6],
      );

      expect(subject.id, 'test_id');
      expect(subject.name, 'Test Subject');
      expect(subject.icon, '📚');
      expect(subject.gradientColors.length, 2);
    });

    test('Lesson model should be created correctly', () {
      const lesson = Lesson(
        id: 'lesson_1',
        title: 'Test Lesson',
        subjectId: 'subject_1',
        content: 'This is test content',
        contentTypes: ['text'],
        downloadStatus: 100,
      );

      expect(lesson.id, 'lesson_1');
      expect(lesson.title, 'Test Lesson');
      expect(lesson.subjectId, 'subject_1');
      expect(lesson.downloadStatus, 100);
    });

    test('Question model should be created correctly', () {
      const question = Question(
        id: 'q1',
        lessonId: 'lesson_1',
        questionText: 'What is 2+2?',
        options: ['3', '4', '5', '6'],
        correctAnswerIndex: 1,
      );

      expect(question.questionText, 'What is 2+2?');
      expect(question.options.length, 4);
      expect(question.correctAnswerIndex, 1);
    });

    test('QuizAttempt should calculate percentage correctly', () {
      final attempt = QuizAttempt(
        id: 'qa1',
        lessonId: 'lesson_1',
        lessonTitle: 'Test Lesson',
        score: 8,
        totalQuestions: 10,
        date: DateTime.now(),
      );

      expect(attempt.percentage, 80.0);
    });
  });
}
