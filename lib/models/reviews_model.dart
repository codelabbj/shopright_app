class ReviewsModel {
  final String name;
  final int rating;
  final String comment;
  final String timeAgo;
  final String product;
  final String avatarUrl;

  ReviewsModel({
    required this.name,
    required this.rating,
    required this.comment,
    required this.timeAgo,
    required this.product,
    required this.avatarUrl,
  });
}
