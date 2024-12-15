import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../exceptions/app_exception.dart';
import '../../models/post.dart';
import '../../services/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(const PostState()) {
    // Gestion de l'événement GetAllPost
    on<GetAllPost>((event, emit) async {
      try {
        emit(state.copyWith(status: PostStatus.loading));
        final post = await postRepository.getAllPost();
        emit(state.copyWith(
          status: PostStatus.success,
          post: post,
        ));
      } catch (error) {
        final appException = AppException.from(error);
        emit(state.copyWith(
          status: PostStatus.error,
          exception: appException,
        ));
      }
    });

    // Gestion de l'événement AddPost
    on<AddPost>((event, emit) async {
      try {
        emit(state.copyWith(status: PostStatus.addingPost));

        // Appeler le repository pour ajouter le post
        final newPost = await postRepository.createPost(
          title: event.post.title,
          description: event.post.description,
        );

        // Mettre à jour l'état avec la liste des posts mise à jour
        emit(state.copyWith(
          status: PostStatus.successAddingPost,
          post: List.from(state.post)..add(newPost),
        ));
      } catch (error) {
        final appException = AppException.from(error);
        emit(state.copyWith(
          status: PostStatus.errorAddingPost,
          exception: appException,
        ));
      }
    });
  }
}
