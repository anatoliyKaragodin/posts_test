part of 'mapper/models_mapper.dart';

@MappableClass()
class CommentModel with CommentModelMappable {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  CommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  CommentEntity toEntity() {
    return CommentEntity(
        postId: postId, id: id, name: name, email: email, body: body);
  }
}
