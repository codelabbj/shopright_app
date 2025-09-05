class OrderListItemModel {
  final int id;
  final String customerName;
  final String customerEmail;
  final String phone;
  final String amount;
  final String paymentMethod;
  final String paymentStatus;
  final String status;
  final String taxAmount;
  final String shippingAmount;
  final String createdAt;
  final String store;

  const OrderListItemModel({
    required this.id,
    required this.customerName,
    required this.customerEmail,
    required this.phone,
    required this.amount,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.status,
    required this.taxAmount,
    required this.shippingAmount,
    required this.createdAt,
    required this.store,
  });
}


