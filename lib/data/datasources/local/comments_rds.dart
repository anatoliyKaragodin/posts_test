import 'package:posts_test/data/models/mapper/models_mapper.dart';
import 'package:posts_test/domain/entities/mapper/entities_mapper.dart';

abstract class CommentsLDS {
  Future<List<CommentModel>?> getPostComments(int postId);

  Future<void> savePostComments(PostEntity post);
}
