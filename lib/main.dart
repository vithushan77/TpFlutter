import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared/blocs/post_bloc/post_bloc.dart';
import 'shared/services/post_repository.dart';
import 'shared/services/local_post_data_source/fake_local_post_data_source.dart';
import 'screens/post/post.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialisation des dépendances
    final postRepository = PostRepository(
      localPostDataSource: FakeLocalPostDataSource(),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => PostBloc(postRepository: postRepository)..add(GetAllPost()),
        child: const PostPage(),
      ),
    );
  }
}
