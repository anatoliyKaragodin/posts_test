import 'package:posts_test/domain/entities/mapper/entities_mapper.dart';

abstract class PostsRepository {
  Future<List<PostEntity>> getAll();

  Future<List<CommentEntity>> getPostComments(int postId);

  void savePostComments(PostEntity post);
}
