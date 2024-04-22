class ImageModel {
  final String url;
  final int likes;
  final int views;
  final int height;
  final int width;

  ImageModel({
    required this.url,
    required this.likes,
    required this.views,
    this.height = 0,
    this.width = 0,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      url: json['webformatURL'],
      likes: json['likes'],
      views: json['views'],
      width: json['webformatWidth'],
      height: json['webformatHeight'],
    );
  }
}
