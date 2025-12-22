class HostelImage {
  final String id;
  final String url;
  final String thumbnailUrl;
  final String caption;
  final int displayOrder;

  HostelImage({
    required this.id,
    required this.url,
    required this.thumbnailUrl,
    required this.caption,
    required this.displayOrder,
  });

  factory HostelImage.fromJson(Map<String, dynamic> json) {
    return HostelImage(
      id: json["id"] as String,
      url: json["url"] as String,
      thumbnailUrl: json["thumbnailUrl"] as String,
      caption: json["caption"] as String,
      displayOrder: json["displayOrder"] as int,
    );
  }
}
