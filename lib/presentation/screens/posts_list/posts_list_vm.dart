import 'package:posts_test/domain/entities/mapper/entities_mapper.dart';
import 'package:posts_test/domain/usecases/posts_usecases.dart';
import 'package:rxdart/subjects.dart';

import '../../../domain/di/di_container.dart';

abstract class IPostsListVM {
  Stream<List<PostEntity>> get postsStream;
  Future<void> getPosts();
}

class PostsListVM extends IPostsListVM {
  PostsListVM() {
    getPosts();
  }

  final _postsSubject = BehaviorSubject<List<PostEntity>>();

  @override
  Stream<List<PostEntity>> get postsStream => _postsSubject.stream;

  @override
  Future<void> getPosts() async {
    try {
      final posts = await getIt.get<PostsUsecases>().getAll();
      _postsSubject.add(posts);
    } catch (e) {
      _postsSubject.addError(e);
    }
  }

  // void dispose() {
  //   _postsSubject.close();
  // }
}
