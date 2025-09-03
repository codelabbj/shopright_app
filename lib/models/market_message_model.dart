class MarketMessageModel {
  final int id;

  final String name;
  final String email;
  final String content;

  final String createdAt;

  MarketMessageModel(
      {required this.id,
      required this.email,
      required this.content,
      required this.name,
      required this.createdAt});
}
