class Video {
  final String id;
  final String uniqueId;
  final String videoType;
  final String videoUrl;
  final String vimeoId;
  final String title;
  final String free;
  final String downloadUrl;
  final String downloadable;
  final String duration;
  final String thumbnail;

  Video({
    required this.id,
    required this.uniqueId,
    required this.videoType,
    required this.videoUrl,
    required this.vimeoId,
    required this.title,
    required this.free,
    required this.downloadUrl,
    required this.downloadable,
    required this.duration,
    required this.thumbnail,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      uniqueId: json['unique_id'],
      videoType: json['video_type'],
      videoUrl: json['video_url'],
      vimeoId: json['vimeo_id'],
      title: json['title'],
      free: json['free'],
      downloadUrl: json['download_url'],
      downloadable: json['downloadable'],
      duration: json['duration'],
      thumbnail: json['thumbnail'],
    );
  }
}

class VideoList {
  final List<Video> videoList;
  final String lastWatchedUniqueId;
  final String lastWatchedDuration;

  VideoList({
    required this.videoList,
    required this.lastWatchedUniqueId,
    required this.lastWatchedDuration,
  });

  factory VideoList.fromJson(Map<String, dynamic> json) {
    var videoListJson = json['video_list'] as List;
    List<Video> videoList = videoListJson.map((video) => Video.fromJson(video)).toList();

    return VideoList(
      videoList: videoList,
      lastWatchedUniqueId: json['last_watched']['unique_id'],
      lastWatchedDuration: json['last_watched']['duration'],
    );
  }
}