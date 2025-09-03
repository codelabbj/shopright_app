class VendorModel {
  final int id;
  final String name;
  final String email;
  final String storeName;
  final String product;
  final String totalRevenue;
  final String storePhone;
  final double balance;
  final String status;
  final String avatar;
  final String createdAt;

  VendorModel(
      {required this.id,
      required this.name,
      required this.avatar,
      required this.balance,
      required this.status,
      required this.storeName,
      required this.storePhone,
      required this.product,
      required this.totalRevenue,
      required this.email,
      required this.createdAt});
}
