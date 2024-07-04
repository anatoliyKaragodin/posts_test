import 'dart:async';

import 'package:posts_test/presentation/screens/post_details/post_details_events.dart';

import '../../router/app_router.dart';

abstract class IPostDetailsBloc {
  StreamSink<PostDetailsEvent> get eventSink;

  void dispose();
}

class PostDetailsBloc extends IPostDetailsBloc {
  static final PostDetailsBloc _instance = PostDetailsBloc._internal();

  PostDetailsBloc._internal() {
    _eventController.stream.listen(_mapEventToState);
  }

  factory PostDetailsBloc() {
    return _instance;
  }

  final _eventController = StreamController<PostDetailsEvent>();

  @override
  StreamSink<PostDetailsEvent> get eventSink => _eventController.sink;

  Future<void> _mapEventToState(PostDetailsEvent event) async {
    switch (event) {
      case GoToPostsList():
        await _goToPostsList();
        break;
    }
  }

  @override
  void dispose() {
    _eventController.close();
  }

  _goToPostsList() {
    RouterHelper.router.go(RouterHelper.postsListsPath);
  }
}
