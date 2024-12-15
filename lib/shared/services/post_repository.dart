import '../models/post.dart';
import 'local_post_data_source/local_post_data_source.dart';

class PostRepository {
  final LocalPostDataSource localPostDataSource;

  const PostRepository({
    required this.localPostDataSource,
  });

  Future<List<Post>> getAllPost() async {
    return localPostDataSource.getAllPosts();
  }

  Future<Post> createPost({
    required String title,
    required String description,
  }) async {
    return localPostDataSource.createPost(
      title: title,
      description: description,
    );
  }
}
