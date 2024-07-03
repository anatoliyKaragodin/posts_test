part of 'mapper/entities_mapper.dart';

@MappableClass()
class PostEntity with PostEntityMappable {
  final String imageUrl;
  final List<CommentEntity> comments;
  final int id;
  final String title;
  final String body;

  PostEntity(
      {required this.imageUrl,
      required this.comments,
      required this.id,
      required this.title,
      required this.body});
}
