class ProductModel {
  final int? id;
  final String? title;
  final String? name;
  final String? location;
  final String? imageUrl;
  final String? price;
  final double? rating;
  final String? seller;
  final String? category;
  final String? time;
  final double? distance;
  final bool? isPromoted;
  final double? currentPrice;
  final double? oldPrice;
  final String? date;

  ProductModel({
    this.id,
    this.name,
    this.title,
    this.location,
    this.imageUrl,
    this.price,
    this.rating,
    this.seller,
    this.category,
    this.time,
    this.distance,
    this.isPromoted = false,
    this.currentPrice,
    this.oldPrice,
    this.date,
  });
}
