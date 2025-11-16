import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_state.dart';
import '../utils/theme.dart';
import '../models/lesson.dart';

class LessonListView extends StatelessWidget {
  const LessonListView({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final subject = appState.selectedSubject;

    if (subject == null) {
      return const Scaffold(
        body: Center(child: Text('No subject selected')),
      );
    }

    final lessons = appState.getLessonsForSubject(subject.id);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => appState.goBack(),
        ),
        title: Row(
          children: [
            Text(subject.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 12),
            Text(subject.name),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          final quizAttempt = appState.getQuizAttemptForLesson(lesson.id);

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _LessonCard(
              lesson: lesson,
              bestScore: quizAttempt?.percentage,
              onTap: () => appState.selectLesson(lesson),
            ),
          );
        },
      ),
    );
  }
}

class _LessonCard extends StatelessWidget {
  final Lesson lesson;
  final double? bestScore;
  final VoidCallback onTap;

  const _LessonCard({
    required this.lesson,
    this.bestScore,
    required this.onTap,
  });

  String _getContentTypeIcons() {
    final icons = <String>[];
    if (lesson.contentTypes.contains('text')) icons.add('📝');
    if (lesson.contentTypes.contains('video')) icons.add('▶️');
    if (lesson.contentTypes.contains('image')) icons.add('🖼️');
    return icons.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          _getContentTypeIcons(),
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 12),
                        if (lesson.downloadStatus == 100)
                          const Icon(
                            Icons.check_circle,
                            size: 16,
                            color: AppTheme.greenAccent,
                          )
                        else
                          Text(
                            '${lesson.downloadStatus}%',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: AppTheme.cyanAccent,
                                ),
                          ),
                      ],
                    ),
                    if (bestScore != null) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 16,
                            color: AppTheme.getScoreColor(bestScore!),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Best: ${bestScore!.toInt()}%',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: AppTheme.getScoreColor(bestScore!),
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppTheme.textTertiary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
