abstract class PostsListEvent {}

class FetchPostsEvent extends PostsListEvent {}

class GoToPostDetails extends PostsListEvent {
  final int postIndex;
  final int postId;

  GoToPostDetails({required this.postIndex, required this.postId});
}
