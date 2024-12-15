import 'package:tp_flutter_twitter/shared/models/post.dart';
import 'package:tp_flutter_twitter/shared/exceptions/app_exception.dart';

import 'local_post_data_source.dart';


class FakeLocalPostDataSource extends LocalPostDataSource {
  final List<Post> _fakePosts = [
    const Post(id: '1', title: 'PSG', description: 'lyon sont nul'),
    const Post(id: '2', title: 'test', description: 'lorum rasle'),
    const Post(id: '3', title: 'ESGI', description: 'trop bien flutter'),
  ];

  @override
  Future<List<Post>> getAllPosts() async {
    List<Post> posts = List.from(_fakePosts);
    await Future.delayed(const Duration(milliseconds: 500));
    return posts;
  }

  @override
  Future<Post> createPost({required title, required description}) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    Post newPost = Post(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        description: description);
    _fakePosts.add(newPost);
    return newPost;
  }

  @override
  Future<Post> updatePost({
    required id,
    required title,
    required description,
  }) async {
    int postToUpdateIndex = _fakePosts.indexWhere((post) => post.id == id);
    if (postToUpdateIndex == -1) {
      throw PostDoesNotExistException();
    }
    await Future.delayed(const Duration(milliseconds: 1500));
    Post updatedPost = Post(id: id, title: title, description: description);
    _fakePosts[postToUpdateIndex] = updatedPost;

    return updatedPost;
  }
}
