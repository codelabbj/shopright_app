class InvoiceRowModel {
  final int id;
  final String name;
  final String orderCode;
  final String invoiceCode;
  final String amount;
  final String createdAt;
  final String status; // Completed/Pending

  const InvoiceRowModel({
    required this.id,
    required this.name,
    required this.orderCode,
    required this.invoiceCode,
    required this.amount,
    required this.createdAt,
    required this.status,
  });
}


