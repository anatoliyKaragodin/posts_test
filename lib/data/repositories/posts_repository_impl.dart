import 'package:posts_test/data/datasources/remote/posts_rds.dart';
import 'package:posts_test/domain/entities/mapper/entities_mapper.dart';
import 'package:posts_test/domain/repositories/posts_repository.dart';

class PostsRepositiryImpl extends PostsRepository {
  final PostsRDS rds;

  PostsRepositiryImpl({required this.rds});

  @override
  Future<List<PostEntity>> getAll() async {
    final res = await rds.getAll();

    List<PostEntity> entities = res.map((e) => e.toEntity([])).toList();

    return entities;
  }

  @override
  Future<List<CommentEntity>> getPostComments(int postId) {
    // TODO: implement getPostComments
    throw UnimplementedError();
  }

  @override
  void savePostComments(PostEntity post) {
    // TODO: implement savePostComments
  }
}
