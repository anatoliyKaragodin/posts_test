import 'dart:async';

import 'package:posts_test/presentation/router/app_router.dart';
import 'package:rxdart/subjects.dart';

import '../../../domain/di/di_container.dart';
import '../../../domain/entities/mapper/entities_mapper.dart';
import '../../../domain/usecases/posts_usecases.dart';
import 'posts_list_events.dart';

abstract class IPostsListBloc {
  Stream<List<PostEntity>> get postsStream;
  StreamSink<PostsListEvent> get eventSink;

  void dispose();
}

class PostsListBloc extends IPostsListBloc {
  static final PostsListBloc _instance = PostsListBloc._internal();

  PostsListBloc._internal() {
    _eventController.stream.listen(_mapEventToState);
    eventSink.add(FetchPostsEvent());
  }

  factory PostsListBloc() {
    return _instance;
  }

  final _postsSubject = BehaviorSubject<List<PostEntity>>();

  @override
  Stream<List<PostEntity>> get postsStream => _postsSubject.stream;
  Sink<List<PostEntity>> get _postsSink => _postsSubject.sink;

  final _eventController = StreamController<PostsListEvent>();

  @override
  StreamSink<PostsListEvent> get eventSink => _eventController.sink;

  @override
  void dispose() {
    _postsSubject.close();
    _eventController.close();
  }

  Future<void> _mapEventToState(PostsListEvent event) async {
    switch (event) {
      case FetchPostsEvent():
        await _getPosts();

        break;

      case GoToPostDetails():
        _getPostComments(event.postIndex, event.postId);

        _goToPostDetails(event.postIndex);

        break;
    }
  }

  Future<void> _getPosts() async {
    try {
      final posts = await getIt.get<PostsUsecases>().getAll();
      _postsSink.add(posts);
    } catch (e) {
      _postsSubject.addError(e);
    }
  }

  /// postIndex это индекс поста в ленте UI, postId это его поле id
  Future<void> _getPostComments(int postIndex, int postId) async {
    final comments = await getIt.get<PostsUsecases>().getPostComments(postId);

    List<PostEntity> posts = await postsStream.first;

    posts[postIndex] = posts[postIndex].copyWith(comments: comments);

    _postsSink.add(posts);

    _savePostComments(posts[postIndex]);
  }

  void _goToPostDetails(int postIndex) {
    RouterHelper.router
        .go(RouterHelper.postDeatailsPath, extra: {'postIndex': postIndex});
  }

  void _savePostComments(PostEntity post) {
    getIt.get<PostsUsecases>().savePostComments(post);
  }
}
