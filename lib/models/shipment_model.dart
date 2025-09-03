class ShipmentModel {
  final int id;
  final String orderCode;
  final String customerName;
  final String customerEmail;
  final String phone;
  final String shippingAmount;
  final String status; // Delivered/Approved
  final String codStatus; // Not available
  final String createdAt;

  const ShipmentModel({
    required this.id,
    required this.orderCode,
    required this.customerName,
    required this.customerEmail,
    required this.phone,
    required this.shippingAmount,
    required this.status,
    required this.codStatus,
    required this.createdAt,
  });
}


