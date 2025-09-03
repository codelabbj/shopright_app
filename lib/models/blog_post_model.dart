class BlogPostModel {
  final int id;
  final String title;
  final String imageUrl;
  final List<String> categories;
  final String author;
  final String createdAt;
  final String status;

  const BlogPostModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.categories,
    required this.author,
    required this.createdAt,
    required this.status,
  });
}


