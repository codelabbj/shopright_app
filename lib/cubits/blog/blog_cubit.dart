import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/blog_post_model.dart';
import '../../models/blog_tag_model.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit()
      : super(const BlogState(
          posts: [],
          tags: [],
        )) {
    loadSampleData();
  }

  void loadSampleData() {
    final List<BlogPostModel> seedPosts = [
      BlogPostModel(
        id: 1,
        title: "4 Expert Tips On How To Choose The Right Men's Wallet",
        imageUrl: 'assets/images/mobile-shopping-app.jpg',
        categories: const ["Ecological", "Fashion"],
        author: 'Darius Brakus',
        createdAt: '2025-08-08',
        status: 'Published',
      ),
    ];

    final List<BlogTagModel> seedTags = const [
      BlogTagModel(id: 1, name: 'General', createdAt: '2025-08-08', status: 'Published'),
      BlogTagModel(id: 2, name: 'Design', createdAt: '2025-08-08', status: 'Published'),
    ];

    emit(state.copyWith(posts: seedPosts, tags: seedTags));
  }
}


