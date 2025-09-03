class WithdrawalModel {
  final int id;

  final String vendor;
  final String amount;
  final String fee;
  final String status;

  final String createdAt;

  WithdrawalModel({required this.id, required this.status, required this.amount, required this.fee, required this.vendor, required this.createdAt});
}
