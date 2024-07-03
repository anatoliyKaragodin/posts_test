import 'package:posts_test/domain/entities/mapper/entities_mapper.dart';
import 'package:posts_test/domain/repositories/posts_repository.dart';

class PostsUsecases {
  final PostsRepository repository;

  PostsUsecases({required this.repository});

  Future<List<PostEntity>> getAll() async {
    // try {
      return await repository.getAll();
    // } catch (e) {
    //   throw Exception('Ошибка загрузки постов');
    // }
  }

  Future<List<CommentEntity>> getPostComments(int postId) async {
    try {
      return await repository.getPostComments(postId);
    } catch (e) {
      throw Exception('Ошибка загрузки комментариев');
    }
  }

  void savePostComments(PostEntity post) {
    try {
      repository.savePostComments(post);
    } catch (e) {
      throw Exception('Ошибка сохранения комментариев поста');
    }
  }
}
