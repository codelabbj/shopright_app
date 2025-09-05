class CustomerModel {
  final int id;
  final String name;
  final String email;
  final bool isVendor;
  final String avatar;
  final String status;
  final String createdAt;

  const CustomerModel({
    required this.id,
    required this.name,
    required this.email,
    required this.isVendor,
    required this.avatar,
    required this.status,
    required this.createdAt,
  });
}


