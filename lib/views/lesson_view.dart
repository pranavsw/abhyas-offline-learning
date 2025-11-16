import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_state.dart';
import '../utils/theme.dart';
import '../services/gemini_service.dart';
import '../utils/mock_data.dart';
import 'quiz_view.dart';

class LessonView extends StatefulWidget {
  final GeminiService geminiService;

  const LessonView({
    super.key,
    required this.geminiService,
  });

  @override
  State<LessonView> createState() => _LessonViewState();
}

class _LessonViewState extends State<LessonView> {
  bool _isLoadingSummary = false;
  String? _summary;

  Future<void> _summarizeLesson(String content) async {
    setState(() {
      _isLoadingSummary = true;
      _summary = null;
    });

    final summary = await widget.geminiService.summarizeText(content);

    if (mounted) {
      setState(() {
        _isLoadingSummary = false;
        _summary = summary;
      });

      _showSummaryDialog();
    }
  }

  void _showSummaryDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.auto_awesome_rounded, color: AppTheme.cyanAccent),
            const SizedBox(width: 8),
            const Text('AI Summary'),
          ],
        ),
        content: SingleChildScrollView(
          child: Text(_summary ?? ''),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _startQuiz(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    final lesson = appState.selectedLesson;
    
    if (lesson == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizView(lesson: lesson),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final lesson = appState.selectedLesson;

    if (lesson == null) {
      return const Scaffold(
        body: Center(child: Text('No lesson selected')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => appState.goBack(),
        ),
        title: Text(
          lesson.title,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          // Action buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Placeholder for read aloud
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Read Aloud feature coming soon!'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.volume_up_rounded),
                    label: const Text('Read Aloud'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.textPrimary,
                      side: BorderSide(color: AppTheme.textTertiary.withOpacity(0.3)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _isLoadingSummary
                        ? null
                        : () => _summarizeLesson(lesson.content),
                    icon: _isLoadingSummary
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.auto_awesome_rounded),
                    label: Text(_isLoadingSummary ? 'Loading...' : 'AI Summarize'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Lesson content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.content,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.6,
                          letterSpacing: 0.3,
                        ),
                  ),
                  const SizedBox(height: 80), // Space for fixed button
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
            onPressed: () => _startQuiz(context),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: AppTheme.cyanAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.quiz_rounded, size: 24),
                const SizedBox(width: 8),
                Text(
                  'Take 10-Question Quiz',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
