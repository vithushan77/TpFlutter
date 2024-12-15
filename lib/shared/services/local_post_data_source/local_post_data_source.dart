import '../../models/post.dart';

abstract class LocalPostDataSource {
  Future<List<Post>> getAllPosts();

  Future<Post> createPost({
    required final title,
    required final description,
  });

  Future<Post> updatePost({
    required final id,
    required final title,
    required final description,
  });
}
