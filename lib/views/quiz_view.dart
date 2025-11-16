import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/lesson.dart';
import '../models/question.dart';
import '../models/quiz_attempt.dart';
import '../utils/app_state.dart';
import '../utils/theme.dart';
import '../utils/mock_data.dart';

class QuizView extends StatefulWidget {
  final Lesson lesson;

  const QuizView({
    super.key,
    required this.lesson,
  });

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  late List<Question> _questions;
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;
  bool _isAnswered = false;
  bool _isQuizComplete = false;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  void _loadQuestions() {
    // Get questions for this lesson
    _questions = mockQuestions
        .where((q) => q.lessonId == widget.lesson.id)
        .take(10)
        .toList();

    if (_questions.isEmpty) {
      // No questions found - should not happen with mock data
      Navigator.pop(context);
    }
  }

  void _selectAnswer(int index) {
    if (_isAnswered) return;

    setState(() {
      _selectedAnswerIndex = index;
      _isAnswered = true;

      if (index == _currentQuestion.correctAnswerIndex) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswerIndex = null;
        _isAnswered = false;
      });
    } else {
      _finishQuiz();
    }
  }

  void _finishQuiz() {
    final appState = Provider.of<AppState>(context, listen: false);
    final attempt = QuizAttempt(
      id: 'qa_${DateTime.now().millisecondsSinceEpoch}',
      lessonId: widget.lesson.id,
      lessonTitle: widget.lesson.title,
      score: _score,
      totalQuestions: _questions.length,
      date: DateTime.now(),
    );

    appState.addQuizAttempt(attempt);

    setState(() {
      _isQuizComplete = true;
    });
  }

  Question get _currentQuestion => _questions[_currentQuestionIndex];

  double get _progress => (_currentQuestionIndex + 1) / _questions.length;

  @override
  Widget build(BuildContext context) {
    if (_isQuizComplete) {
      return _buildResultsScreen();
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => _showExitDialog(),
        ),
        title: Text('Question ${_currentQuestionIndex + 1} of ${_questions.length}'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.cyanAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Score: $_score',
                  style: const TextStyle(
                    color: AppTheme.cyanAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress bar
          LinearProgressIndicator(
            value: _progress,
            backgroundColor: AppTheme.darkCard,
            valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.cyanAccent),
            minHeight: 4,
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Question
                  Text(
                    _currentQuestion.questionText,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          height: 1.4,
                        ),
                  ),
                  const SizedBox(height: 32),

                  // Answer options
                  ..._currentQuestion.options.asMap().entries.map((entry) {
                    final index = entry.key;
                    final option = entry.value;
                    return _AnswerOption(
                      text: option,
                      isSelected: _selectedAnswerIndex == index,
                      isCorrect: index == _currentQuestion.correctAnswerIndex,
                      isAnswered: _isAnswered,
                      onTap: () => _selectAnswer(index),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),

          // Next/Finish button
          if (_isAnswered)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.darkSurface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    _currentQuestionIndex < _questions.length - 1
                        ? 'Next Question'
                        : 'Finish Quiz',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildResultsScreen() {
    final percentage = (_score / _questions.length * 100).round();
    final color = AppTheme.getScoreColor(percentage.toDouble());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                percentage >= 80
                    ? Icons.celebration_rounded
                    : percentage >= 50
                        ? Icons.thumb_up_rounded
                        : Icons.psychology_rounded,
                size: 80,
                color: color,
              ),
              const SizedBox(height: 24),
              Text(
                'Quiz Complete!',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 16),
              Text(
                '$_score out of ${_questions.length}',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: color,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                '$percentage%',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Back to Lesson'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit Quiz?'),
        content: const Text('Your progress will not be saved if you exit now.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close quiz
            },
            child: const Text('Exit', style: TextStyle(color: AppTheme.redAccent)),
          ),
        ],
      ),
    );
  }
}

class _AnswerOption extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool isAnswered;
  final VoidCallback onTap;

  const _AnswerOption({
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.isAnswered,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = AppTheme.textTertiary.withOpacity(0.3);
    Color? backgroundColor;

    if (isAnswered) {
      if (isCorrect) {
        borderColor = AppTheme.greenAccent;
        backgroundColor = AppTheme.greenAccent.withOpacity(0.1);
      } else if (isSelected && !isCorrect) {
        borderColor = AppTheme.redAccent;
        backgroundColor = AppTheme.redAccent.withOpacity(0.1);
      }
    } else if (isSelected) {
      borderColor = AppTheme.cyanAccent;
      backgroundColor = AppTheme.cyanAccent.withOpacity(0.1);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: backgroundColor ?? AppTheme.darkCard,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: isAnswered ? null : onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                if (isAnswered && isCorrect)
                  const Icon(
                    Icons.check_circle_rounded,
                    color: AppTheme.greenAccent,
                  )
                else if (isAnswered && isSelected && !isCorrect)
                  const Icon(
                    Icons.cancel_rounded,
                    color: AppTheme.redAccent,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
