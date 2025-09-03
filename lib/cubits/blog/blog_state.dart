part of 'blog_cubit.dart';

class BlogState extends Equatable {
  final List<BlogPostModel> posts;
  final List<BlogTagModel> tags;

  const BlogState({required this.posts, required this.tags});

  BlogState copyWith({List<BlogPostModel>? posts, List<BlogTagModel>? tags}) {
    return BlogState(
      posts: posts ?? this.posts,
      tags: tags ?? this.tags,
    );
  }

  @override
  List<Object?> get props => [posts, tags];
}


