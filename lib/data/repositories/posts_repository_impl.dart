import 'package:posts_test/data/datasources/local/comments_rds.dart';
import 'package:posts_test/data/datasources/remote/posts_rds.dart';
import 'package:posts_test/data/models/mapper/models_mapper.dart';
import 'package:posts_test/domain/entities/mapper/entities_mapper.dart';
import 'package:posts_test/domain/repositories/posts_repository.dart';

class PostsRepositiryImpl extends PostsRepository {
  final PostsRDS postsRDS;
  final CommentsLDS commentsLDS;

  PostsRepositiryImpl({required this.postsRDS, required this.commentsLDS});

  @override
  Future<List<PostEntity>> getAll() async {
    try {
      final res = await postsRDS.getAll();

      List<PostEntity> entities = res.map((e) => e.toEntity([])).toList();

      return entities;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<CommentEntity>> getPostComments(int postId) async {
    try {
      List<CommentModel>? res = await commentsLDS.getPostComments(postId);

      res ??= await postsRDS.getPostComments(postId);

      List<CommentEntity> entities = res.map((e) => e.toEntity()).toList();

      return entities;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void savePostComments(PostEntity post) async {
    try {
      await commentsLDS.savePostComments(post);
    } catch (e) {
      throw Exception(e);
    }
  }
}
