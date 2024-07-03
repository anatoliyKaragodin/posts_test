// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'models_mapper.dart';

class PostModelMapper extends ClassMapperBase<PostModel> {
  PostModelMapper._();

  static PostModelMapper? _instance;
  static PostModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PostModel';

  static int _$userId(PostModel v) => v.userId;
  static const Field<PostModel, int> _f$userId = Field('userId', _$userId);
  static int _$id(PostModel v) => v.id;
  static const Field<PostModel, int> _f$id = Field('id', _$id);
  static String _$title(PostModel v) => v.title;
  static const Field<PostModel, String> _f$title = Field('title', _$title);
  static String _$body(PostModel v) => v.body;
  static const Field<PostModel, String> _f$body = Field('body', _$body);
  static String? _$imageurl(PostModel v) => v.imageurl;
  static const Field<PostModel, String> _f$imageurl =
      Field('imageurl', _$imageurl);

  @override
  final MappableFields<PostModel> fields = const {
    #userId: _f$userId,
    #id: _f$id,
    #title: _f$title,
    #body: _f$body,
    #imageurl: _f$imageurl,
  };

  static PostModel _instantiate(DecodingData data) {
    return PostModel(
        userId: data.dec(_f$userId),
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        body: data.dec(_f$body),
        imageurl: data.dec(_f$imageurl));
  }

  @override
  final Function instantiate = _instantiate;

  static PostModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PostModel>(map);
  }

  static PostModel fromJson(String json) {
    return ensureInitialized().decodeJson<PostModel>(json);
  }
}

mixin PostModelMappable {
  String toJson() {
    return PostModelMapper.ensureInitialized()
        .encodeJson<PostModel>(this as PostModel);
  }

  Map<String, dynamic> toMap() {
    return PostModelMapper.ensureInitialized()
        .encodeMap<PostModel>(this as PostModel);
  }

  PostModelCopyWith<PostModel, PostModel, PostModel> get copyWith =>
      _PostModelCopyWithImpl(this as PostModel, $identity, $identity);
  @override
  String toString() {
    return PostModelMapper.ensureInitialized()
        .stringifyValue(this as PostModel);
  }

  @override
  bool operator ==(Object other) {
    return PostModelMapper.ensureInitialized()
        .equalsValue(this as PostModel, other);
  }

  @override
  int get hashCode {
    return PostModelMapper.ensureInitialized().hashValue(this as PostModel);
  }
}

extension PostModelValueCopy<$R, $Out> on ObjectCopyWith<$R, PostModel, $Out> {
  PostModelCopyWith<$R, PostModel, $Out> get $asPostModel =>
      $base.as((v, t, t2) => _PostModelCopyWithImpl(v, t, t2));
}

abstract class PostModelCopyWith<$R, $In extends PostModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? userId, int? id, String? title, String? body, String? imageurl});
  PostModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PostModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PostModel, $Out>
    implements PostModelCopyWith<$R, PostModel, $Out> {
  _PostModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PostModel> $mapper =
      PostModelMapper.ensureInitialized();
  @override
  $R call(
          {int? userId,
          int? id,
          String? title,
          String? body,
          Object? imageurl = $none}) =>
      $apply(FieldCopyWithData({
        if (userId != null) #userId: userId,
        if (id != null) #id: id,
        if (title != null) #title: title,
        if (body != null) #body: body,
        if (imageurl != $none) #imageurl: imageurl
      }));
  @override
  PostModel $make(CopyWithData data) => PostModel(
      userId: data.get(#userId, or: $value.userId),
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      body: data.get(#body, or: $value.body),
      imageurl: data.get(#imageurl, or: $value.imageurl));

  @override
  PostModelCopyWith<$R2, PostModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PostModelCopyWithImpl($value, $cast, t);
}

class CommentModelMapper extends ClassMapperBase<CommentModel> {
  CommentModelMapper._();

  static CommentModelMapper? _instance;
  static CommentModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommentModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CommentModel';

  static int _$postId(CommentModel v) => v.postId;
  static const Field<CommentModel, int> _f$postId = Field('postId', _$postId);
  static int _$id(CommentModel v) => v.id;
  static const Field<CommentModel, int> _f$id = Field('id', _$id);
  static String _$name(CommentModel v) => v.name;
  static const Field<CommentModel, String> _f$name = Field('name', _$name);
  static String _$email(CommentModel v) => v.email;
  static const Field<CommentModel, String> _f$email = Field('email', _$email);
  static String _$body(CommentModel v) => v.body;
  static const Field<CommentModel, String> _f$body = Field('body', _$body);

  @override
  final MappableFields<CommentModel> fields = const {
    #postId: _f$postId,
    #id: _f$id,
    #name: _f$name,
    #email: _f$email,
    #body: _f$body,
  };

  static CommentModel _instantiate(DecodingData data) {
    return CommentModel(
        postId: data.dec(_f$postId),
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        email: data.dec(_f$email),
        body: data.dec(_f$body));
  }

  @override
  final Function instantiate = _instantiate;

  static CommentModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommentModel>(map);
  }

  static CommentModel fromJson(String json) {
    return ensureInitialized().decodeJson<CommentModel>(json);
  }
}

mixin CommentModelMappable {
  String toJson() {
    return CommentModelMapper.ensureInitialized()
        .encodeJson<CommentModel>(this as CommentModel);
  }

  Map<String, dynamic> toMap() {
    return CommentModelMapper.ensureInitialized()
        .encodeMap<CommentModel>(this as CommentModel);
  }

  CommentModelCopyWith<CommentModel, CommentModel, CommentModel> get copyWith =>
      _CommentModelCopyWithImpl(this as CommentModel, $identity, $identity);
  @override
  String toString() {
    return CommentModelMapper.ensureInitialized()
        .stringifyValue(this as CommentModel);
  }

  @override
  bool operator ==(Object other) {
    return CommentModelMapper.ensureInitialized()
        .equalsValue(this as CommentModel, other);
  }

  @override
  int get hashCode {
    return CommentModelMapper.ensureInitialized()
        .hashValue(this as CommentModel);
  }
}

extension CommentModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CommentModel, $Out> {
  CommentModelCopyWith<$R, CommentModel, $Out> get $asCommentModel =>
      $base.as((v, t, t2) => _CommentModelCopyWithImpl(v, t, t2));
}

abstract class CommentModelCopyWith<$R, $In extends CommentModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? postId, int? id, String? name, String? email, String? body});
  CommentModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommentModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CommentModel, $Out>
    implements CommentModelCopyWith<$R, CommentModel, $Out> {
  _CommentModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CommentModel> $mapper =
      CommentModelMapper.ensureInitialized();
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
  CommentModel $make(CopyWithData data) => CommentModel(
      postId: data.get(#postId, or: $value.postId),
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      email: data.get(#email, or: $value.email),
      body: data.get(#body, or: $value.body));

  @override
  CommentModelCopyWith<$R2, CommentModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CommentModelCopyWithImpl($value, $cast, t);
}
