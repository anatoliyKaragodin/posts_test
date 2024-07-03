part of 'mapper/models_mapper.dart';

@MappableClass()
class PostModel with PostModelMappable {
  final int userId;
  final int id;
  final String title;
  final String body;
  final String? imageurl;

  PostModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body,
      required this.imageurl});

  PostEntity toEntity(List<CommentModel> comments) {
    return PostEntity(
        imageUrl: imageurl ?? '',
        comments: comments.map((e) => e.toEntity()).toList(),
        id: id,
        title: title,
        body: body);
  }
}
