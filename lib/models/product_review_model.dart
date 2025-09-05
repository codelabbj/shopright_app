class ProductReviewModel {
  final int id;
  final String product;
  final String user;
  final int stars;
  final String comment;
  final String image;
  final String status;
  final String createdAt;

  const ProductReviewModel({
    required this.id,
    required this.product,
    required this.user,
    required this.stars,
    required this.comment,
    required this.image,
    required this.status,
    required this.createdAt,
  });
}


