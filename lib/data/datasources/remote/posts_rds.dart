import 'package:posts_test/data/models/mapper/models_mapper.dart';

abstract class PostsRDS {
  Future<List<PostModel>> getAll();

  Future<List<CommentModel>> getPostComments(int postId);
}
