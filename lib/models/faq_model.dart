class FaqModel {
  final int id;
  final String question;
  final String category;
  final String createdAt;
  final String status;

  const FaqModel({
    required this.id,
    required this.question,
    required this.category,
    required this.createdAt,
    required this.status,
  });
}


