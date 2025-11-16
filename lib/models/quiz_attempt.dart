class QuizAttempt {
  final String id;
  final String lessonId;
  final String lessonTitle;
  final int score;
  final int totalQuestions;
  final DateTime date;

  const QuizAttempt({
    required this.id,
    required this.lessonId,
    required this.lessonTitle,
    required this.score,
    required this.totalQuestions,
    required this.date,
  });

  double get percentage => (score / totalQuestions) * 100;

  Map<String, dynamic> toJson() => {
        'id': id,
        'lessonId': lessonId,
        'lessonTitle': lessonTitle,
        'score': score,
        'totalQuestions': totalQuestions,
        'date': date.toIso8601String(),
      };

  factory QuizAttempt.fromJson(Map<String, dynamic> json) => QuizAttempt(
        id: json['id'],
        lessonId: json['lessonId'],
        lessonTitle: json['lessonTitle'],
        score: json['score'],
        totalQuestions: json['totalQuestions'],
        date: DateTime.parse(json['date']),
      );
}
