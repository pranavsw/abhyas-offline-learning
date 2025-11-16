class Subject {
  final String id;
  final String name;
  final String icon; // Emoji
  final List<int> gradientColors; // Two colors for gradient [start, end]

  const Subject({
    required this.id,
    required this.name,
    required this.icon,
    required this.gradientColors,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
        'gradientColors': gradientColors,
      };

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json['id'],
        name: json['name'],
        icon: json['icon'],
        gradientColors: List<int>.from(json['gradientColors']),
      );
}
