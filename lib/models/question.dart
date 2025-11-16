class Question {
  final String id;
  final String lessonId;
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  const Question({
    required this.id,
    required this.lessonId,
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'lessonId': lessonId,
        'questionText': questionText,
        'options': options,
        'correctAnswerIndex': correctAnswerIndex,
      };

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json['id'],
        lessonId: json['lessonId'],
        questionText: json['questionText'],
        options: List<String>.from(json['options']),
        correctAnswerIndex: json['correctAnswerIndex'],
      );
}
