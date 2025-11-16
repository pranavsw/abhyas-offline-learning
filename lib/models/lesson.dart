class Lesson {
  final String id;
  final String title;
  final String subjectId;
  final String content;
  final List<String> contentTypes; // ['text', 'video', 'image']
  final int downloadStatus; // 0-100
  final String? videoUrl;
  final List<String> imageUrls;

  const Lesson({
    required this.id,
    required this.title,
    required this.subjectId,
    required this.content,
    required this.contentTypes,
    required this.downloadStatus,
    this.videoUrl,
    this.imageUrls = const [],
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subjectId': subjectId,
        'content': content,
        'contentTypes': contentTypes,
        'downloadStatus': downloadStatus,
        'videoUrl': videoUrl,
        'imageUrls': imageUrls,
      };

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json['id'],
        title: json['title'],
        subjectId: json['subjectId'],
        content: json['content'],
        contentTypes: List<String>.from(json['contentTypes']),
        downloadStatus: json['downloadStatus'],
        videoUrl: json['videoUrl'],
        imageUrls: List<String>.from(json['imageUrls'] ?? []),
      );
}
