part of 'post_bloc.dart';

@immutable
sealed class PostEvent {
  const PostEvent();
}

class GetAllPost extends PostEvent {
  const GetAllPost();
}

class AddPost extends PostEvent {
  final Post post;
  const AddPost(this.post);
}

class UpdatePost extends PostEvent {
  final Post post;
  const UpdatePost(this.post);
}
