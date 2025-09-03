class ProductPriceModel {
  final int id;
  final String title;
  final String sku;
  final String imageAsset;
  final String? costPerItem;
  final String? price;
  final String? salePrice;

  const ProductPriceModel({
    required this.id,
    required this.title,
    required this.sku,
    required this.imageAsset,
    this.costPerItem,
    this.price,
    this.salePrice,
  });
}


