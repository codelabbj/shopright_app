class OrderReturnModel {
  final int id;
  final String orderId;
  final String customerName;
  final String customerEmail;
  final String productItems;
  final String reason;
  final String status;
  final String createdAt;

  const OrderReturnModel({
    required this.id,
    required this.orderId,
    required this.customerName,
    required this.customerEmail,
    required this.productItems,
    required this.reason,
    required this.status,
    required this.createdAt,
  });
}


