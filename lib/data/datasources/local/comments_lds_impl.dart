import 'dart:convert';

import 'package:posts_test/data/datasources/local/comments_rds.dart';
import 'package:posts_test/data/models/mapper/models_mapper.dart';
import 'package:posts_test/domain/entities/mapper/entities_mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:developer' as dev;

class CommentsLDSImpl extends CommentsLDS {
  final SharedPreferences sharedPreferences;

  CommentsLDSImpl({required this.sharedPreferences});

  @override
  Future<List<CommentModel>?> getPostComments(int postId) async {
    dev.log(postId.toString());

    final String? encodedData =
        sharedPreferences.getString('post_comments_$postId');

    dev.log('Загружены комментарии поста $postId LDS: $encodedData');

    if (encodedData == null) {
      return null;
    } else {
      final List<dynamic> decodedData = jsonDecode(encodedData);

      dev.log('Загружены комментарии поста $postId LDS: $decodedData');

      return decodedData
          .map((item) => CommentModelMapper.fromJson(item))
          .toList();
    }
  }

  @override
  Future<void> savePostComments(PostEntity post) async {
    final String encodedData =
        jsonEncode(post.comments.map((comment) => comment.toJson()).toList());

    dev.log('Сохранены комментарии поста ${post.id} LDS: $encodedData');

    await sharedPreferences.setString('post_comments_${post.id}', encodedData);
  }
}
