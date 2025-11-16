import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../utils/app_state.dart';
import '../utils/theme.dart';
import '../models/quiz_attempt.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final attempts = appState.quizAttempts;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Progress',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Track your quiz history',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                  ),
                ],
              ),
            ),

            // Quiz history
            if (attempts.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.quiz_outlined,
                        size: 64,
                        color: AppTheme.textTertiary.withOpacity(0.5),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No quizzes completed yet',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppTheme.textTertiary,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Take a quiz to see your progress here',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: attempts.length,
                  itemBuilder: (context, index) {
                    final attempt = attempts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _QuizAttemptCard(attempt: attempt),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _QuizAttemptCard extends StatelessWidget {
  final QuizAttempt attempt;

  const _QuizAttemptCard({required this.attempt});

  @override
  Widget build(BuildContext context) {
    final percentage = attempt.percentage;
    final scoreColor = AppTheme.getScoreColor(percentage);
    final dateFormatter = DateFormat('MMM d, y');

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        attempt.lessonTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        dateFormatter.format(attempt.date),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: scoreColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: scoreColor,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${percentage.toInt()}%',
                        style: TextStyle(
                          color: scoreColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${attempt.score}/${attempt.totalQuestions}',
                        style: TextStyle(
                          color: scoreColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: percentage / 100,
                backgroundColor: AppTheme.darkSurface,
                valueColor: AlwaysStoppedAnimation<Color>(scoreColor),
                minHeight: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
