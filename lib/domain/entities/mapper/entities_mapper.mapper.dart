// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'entities_mapper.dart';

class CommentEntityMapper extends ClassMapperBase<CommentEntity> {
  CommentEntityMapper._();

  static CommentEntityMapper? _instance;
  static CommentEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommentEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CommentEntity';

  static int _$postId(CommentEntity v) => v.postId;
  static const Field<CommentEntity, int> _f$postId = Field('postId', _$postId);
  static int _$id(CommentEntity v) => v.id;
  static const Field<CommentEntity, int> _f$id = Field('id', _$id);
  static String _$name(CommentEntity v) => v.name;
  static const Field<CommentEntity, String> _f$name = Field('name', _$name);
  static String _$email(CommentEntity v) => v.email;
  static const Field<CommentEntity, String> _f$email = Field('email', _$email);
  static String _$body(CommentEntity v) => v.body;
  static const Field<CommentEntity, String> _f$body = Field('body', _$body);

  @override
  final MappableFields<CommentEntity> fields = const {
    #postId: _f$postId,
    #id: _f$id,
    #name: _f$name,
    #email: _f$email,
    #body: _f$body,
  };

  static CommentEntity _instantiate(DecodingData data) {
    return CommentEntity(
        postId: data.dec(_f$postId),
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        email: data.dec(_f$email),
        body: data.dec(_f$body));
  }

  @override
  final Function instantiate = _instantiate;

  static CommentEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommentEntity>(map);
  }

  static CommentEntity fromJson(String json) {
    return ensureInitialized().decodeJson<CommentEntity>(json);
  }
}

mixin CommentEntityMappable {
  String toJson() {
    return CommentEntityMapper.ensureInitialized()
        .encodeJson<CommentEntity>(this as CommentEntity);
  }

  Map<String, dynamic> toMap() {
    return CommentEntityMapper.ensureInitialized()
        .encodeMap<CommentEntity>(this as CommentEntity);
  }

  CommentEntityCopyWith<CommentEntity, CommentEntity, CommentEntity>
      get copyWith => _CommentEntityCopyWithImpl(
          this as CommentEntity, $identity, $identity);
  @override
  String toString() {
    return CommentEntityMapper.ensureInitialized()
        .stringifyValue(this as CommentEntity);
  }

  @override
  bool operator ==(Object other) {
    return CommentEntityMapper.ensureInitialized()
        .equalsValue(this as CommentEntity, other);
  }

  @override
  int get hashCode {
    return CommentEntityMapper.ensureInitialized()
        .hashValue(this as CommentEntity);
  }
}

extension CommentEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CommentEntity, $Out> {
  CommentEntityCopyWith<$R, CommentEntity, $Out> get $asCommentEntity =>
      $base.as((v, t, t2) => _CommentEntityCopyWithImpl(v, t, t2));
}

abstract class CommentEntityCopyWith<$R, $In extends CommentEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? postId, int? id, String? name, String? email, String? body});
  CommentEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommentEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CommentEntity, $Out>
    implements CommentEntityCopyWith<$R, CommentEntity, $Out> {
  _CommentEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CommentEntity> $mapper =
      CommentEntityMapper.ensureInitialized();
  @override
  $R call({int? postId, int? id, String? name, String? email, String? body}) =>
      $apply(FieldCopyWithData({
        if (postId != null) #postId: postId,
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (email != null) #email: email,
        if (body != null) #body: body
      }));
  @override
  CommentEntity $make(CopyWithData data) => CommentEntity(
      postId: data.get(#postId, or: $value.postId),
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      email: data.get(#email, or: $value.email),
      body: data.get(#body, or: $value.body));

  @override
  CommentEntityCopyWith<$R2, CommentEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CommentEntityCopyWithImpl($value, $cast, t);
}

class PostEntityMapper extends ClassMapperBase<PostEntity> {
  PostEntityMapper._();

  static PostEntityMapper? _instance;
  static PostEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostEntityMapper._());
      CommentEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PostEntity';

  static String _$imageUrl(PostEntity v) => v.imageUrl;
  static const Field<PostEntity, String> _f$imageUrl =
      Field('imageUrl', _$imageUrl);
  static List<CommentEntity> _$comments(PostEntity v) => v.comments;
  static const Field<PostEntity, List<CommentEntity>> _f$comments =
      Field('comments', _$comments);
  static int _$id(PostEntity v) => v.id;
  static const Field<PostEntity, int> _f$id = Field('id', _$id);
  static String _$title(PostEntity v) => v.title;
  static const Field<PostEntity, String> _f$title = Field('title', _$title);
  static String _$body(PostEntity v) => v.body;
  static const Field<PostEntity, String> _f$body = Field('body', _$body);

  @override
  final MappableFields<PostEntity> fields = const {
    #imageUrl: _f$imageUrl,
    #comments: _f$comments,
    #id: _f$id,
    #title: _f$title,
    #body: _f$body,
  };

  static PostEntity _instantiate(DecodingData data) {
    return PostEntity(
        imageUrl: data.dec(_f$imageUrl),
        comments: data.dec(_f$comments),
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        body: data.dec(_f$body));
  }

  @override
  final Function instantiate = _instantiate;

  static PostEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PostEntity>(map);
  }

  static PostEntity fromJson(String json) {
    return ensureInitialized().decodeJson<PostEntity>(json);
  }
}

mixin PostEntityMappable {
  String toJson() {
    return PostEntityMapper.ensureInitialized()
        .encodeJson<PostEntity>(this as PostEntity);
  }

  Map<String, dynamic> toMap() {
    return PostEntityMapper.ensureInitialized()
        .encodeMap<PostEntity>(this as PostEntity);
  }

  PostEntityCopyWith<PostEntity, PostEntity, PostEntity> get copyWith =>
      _PostEntityCopyWithImpl(this as PostEntity, $identity, $identity);
  @override
  String toString() {
    return PostEntityMapper.ensureInitialized()
        .stringifyValue(this as PostEntity);
  }

  @override
  bool operator ==(Object other) {
    return PostEntityMapper.ensureInitialized()
        .equalsValue(this as PostEntity, other);
  }

  @override
  int get hashCode {
    return PostEntityMapper.ensureInitialized().hashValue(this as PostEntity);
  }
}

extension PostEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PostEntity, $Out> {
  PostEntityCopyWith<$R, PostEntity, $Out> get $asPostEntity =>
      $base.as((v, t, t2) => _PostEntityCopyWithImpl(v, t, t2));
}

abstract class PostEntityCopyWith<$R, $In extends PostEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, CommentEntity,
      CommentEntityCopyWith<$R, CommentEntity, CommentEntity>> get comments;
  $R call(
      {String? imageUrl,
      List<CommentEntity>? comments,
      int? id,
      String? title,
      String? body});
  PostEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PostEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PostEntity, $Out>
    implements PostEntityCopyWith<$R, PostEntity, $Out> {
  _PostEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PostEntity> $mapper =
      PostEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, CommentEntity,
          CommentEntityCopyWith<$R, CommentEntity, CommentEntity>>
      get comments => ListCopyWith($value.comments,
          (v, t) => v.copyWith.$chain(t), (v) => call(comments: v));
  @override
  $R call(
          {String? imageUrl,
          List<CommentEntity>? comments,
          int? id,
          String? title,
          String? body}) =>
      $apply(FieldCopyWithData({
        if (imageUrl != null) #imageUrl: imageUrl,
        if (comments != null) #comments: comments,
        if (id != null) #id: id,
        if (title != null) #title: title,
        if (body != null) #body: body
      }));
  @override
  PostEntity $make(CopyWithData data) => PostEntity(
      imageUrl: data.get(#imageUrl, or: $value.imageUrl),
      comments: data.get(#comments, or: $value.comments),
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      body: data.get(#body, or: $value.body));

  @override
  PostEntityCopyWith<$R2, PostEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PostEntityCopyWithImpl($value, $cast, t);
}
