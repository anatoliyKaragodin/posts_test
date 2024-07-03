import 'package:dio/dio.dart';
import 'package:posts_test/data/datasources/remote/posts_rds.dart';
import 'package:posts_test/data/models/mapper/models_mapper.dart';


class PostsRDSImpl extends PostsRDS {
  static const String _postsApiUrl =
      'https://jsonplaceholder.typicode.com/posts';

  static const String _albumsApiUrl =
      'https://jsonplaceholder.typicode.com/albums/';

  @override
  Future<List<PostModel>> getAll() async {
    // try {
    final dio = Dio();
    final response = await dio.get(_postsApiUrl);

    final List<dynamic> postsData = response.data;

    // dev.log('response: $response');
    // dev.log('***response data: ${response.data}');

    final List<PostModel> posts =
        postsData.map((post) => PostModelMapper.fromMap(post)).toList();

    final imageUrls = await _getPostsImages(posts);

    // Assuming PostModel has a method to add image URLs
    for (int i = 0; i < posts.length; i++) {
      posts[i] = posts[i].copyWith(imageurl: imageUrls[i]);
    }

    return posts;
    // } catch (e) {
    //   throw Exception('Ошибка получения постов от сервера: $e');
    // }
  }

  Future<List<String>> _getPostsImages(List<PostModel> posts) async {
    final dio = Dio();
    List<String> imageUrls = [];

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
  }
}
