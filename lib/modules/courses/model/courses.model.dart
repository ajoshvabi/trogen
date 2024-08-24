class Subject {
  String id;
  String title;
  String courseId;
  String? levelId;
  String order;
  String thumbnail;
  String background;
  String icon;
  String free;
  String? instructorId;
  String? oldSectionId;

  Subject({
    required this.id,
    required this.title,
    required this.courseId,
    this.levelId,
    required this.order,
    required this.thumbnail,
    required this.background,
    required this.icon,
    required this.free,
    this.instructorId,
    this.oldSectionId,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      title: json['title'],
      courseId: json['course_id'],
      levelId: json['level_id'],
      order: json['order'],
      thumbnail: json['thumbnail'],
      background: json['background'],
      icon: json['icon'],
      free: json['free'],
      instructorId: json['instructor_id'],
      oldSectionId: json['old_section_id'],
    );
  }
}
