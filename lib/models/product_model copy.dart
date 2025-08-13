class ProductModel {
  final String title;
  final String location;
  final String imageUrl;
  final String price;
  final double rating;
  final String seller;
  final String category;
  final String time;
  final double distance;
  final bool isPromoted;

  ProductModel({
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.seller,
    required this.category,
    required this.time,
    required this.distance,
    this.isPromoted = false,
  });
}
