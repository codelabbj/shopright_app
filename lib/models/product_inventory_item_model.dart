class ProductInventoryItemModel {
  final int id;
  final String title;
  final String sku;
  final String imageAsset;
  final bool storehouseManagement;
  final int quantity;

  const ProductInventoryItemModel({
    required this.id,
    required this.title,
    required this.sku,
    required this.imageAsset,
    required this.storehouseManagement,
    required this.quantity,
  });
}


