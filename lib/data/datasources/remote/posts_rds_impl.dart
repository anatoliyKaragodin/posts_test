import 'package:dio/dio.dart';
import 'package:posts_test/data/datasources/remote/posts_rds.dart';
import 'package:posts_test/data/models/mapper/models_mapper.dart';

class PostsRDSImpl extends PostsRDS {
  PostsRDSImpl({required this.dio});

  final Dio dio;

  static const String _postsApiUrl =
      'https://jsonplaceholder.typicode.com/posts';

  static const String _albumsApiUrl =
      'https://jsonplaceholder.typicode.com/albums/';

  @override
  Future<List<PostModel>> getAll() async {
    try {
      final response = await dio.get(_postsApiUrl);

      final List<dynamic> postsData = response.data;

      final List<PostModel> posts =
          postsData.map((post) => PostModelMapper.fromMap(post)).toList();

      final imageUrls = await _getPostsImages(posts);

      for (int i = 0; i < posts.length; i++) {
        posts[i] = posts[i].copyWith(imageurl: imageUrls[i]);
      }

      return posts;
    } catch (e) {
      throw Exception('Ошибка получения постов от сервера: $e');
    }
  }

  @override
  Future<List<CommentModel>> getPostComments(int postId) async {
    try {
      final response = await dio.get('$_postsApiUrl/$postId/comments');

      final List<dynamic> commentsData = response.data;

      final comments =
          commentsData.map((e) => CommentModelMapper.fromMap(e)).toList();

      return comments;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<String>> _getPostsImages(List<PostModel> posts) async {
    List<String> imageUrls = [];

    try {
      for (PostModel post in posts) {
        final response = await dio.get('$_albumsApiUrl${post.id}/photos');
        final List<dynamic> photosData = response.data;

        if (photosData.isNotEmpty) {
          imageUrls.add(photosData.first['url']);
        } else {
          imageUrls.add('');
        }
      }

      return imageUrls;
    } catch (e) {
      throw Exception(e);
    }
  }
}
