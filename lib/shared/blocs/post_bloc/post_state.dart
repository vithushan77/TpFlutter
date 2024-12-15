part of 'post_bloc.dart';

enum PostStatus {
  initial,
  addingPost,
  successAddingPost,
  errorAddingPost,
  updatingPost,
  successUpdatingPost,
  errorUpdatingPost,
  errorAddPost,
  loading,
  success,
  error,
}

class PostState {
  final PostStatus status;
  final List<Post> post;
  final AppException? exception;

  const PostState({
    this.status = PostStatus.initial,
    this.post = const [],
    this.exception,
  });

  PostState copyWith({
    PostStatus? status,
    List<Post>? post,
    AppException? exception,
  }){
    return PostState(
      status: status ?? this.status,
      post: post ?? this.post,
      exception: exception ?? this.exception,
    );
  }

}