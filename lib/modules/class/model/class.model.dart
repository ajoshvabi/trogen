class Data {
  String id;
  String title;
  int index;
  String isLocked;
  List<Section> sections;
  String completion;

  Data({
    required this.id,
    required this.title,
    required this.index,
    required this.isLocked,
    required this.sections,
    required this.completion,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['title'],
      index: json['index'],
      isLocked: json['is_locked'],
      sections:
          List<Section>.from(json['sections'].map((x) => Section.fromJson(x))),
      completion: json['completion'],
    );
  }
}

class Section {
  String id;
  String title;
  String thumbnail;
  String icon;
  String free;
  int isAttendedNew;
  int isAttended;
  int isCompleted;
  int total;
  String videoCount;
  int completed;

  Section({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.icon,
    required this.free,
    required this.isAttendedNew,
    required this.isAttended,
    required this.isCompleted,
    required this.total,
    required this.videoCount,
    required this.completed,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      icon: json['icon'],
      free: json['free'],
      isAttendedNew: json['is_attended_new'],
      isAttended: json['is_attended'],
      isCompleted: json['is_completed'],
      total: json['total'],
      videoCount: json['video_count'],
      completed: json['completed'],
    );
  }
}
