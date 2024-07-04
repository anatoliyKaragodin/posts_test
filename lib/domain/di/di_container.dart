import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:posts_test/data/datasources/local/comments_lds_impl.dart';
import 'package:posts_test/data/datasources/local/comments_rds.dart';
import 'package:posts_test/data/datasources/remote/posts_rds.dart';
import 'package:posts_test/data/datasources/remote/posts_rds_impl.dart';
import 'package:posts_test/data/repositories/posts_repository_impl.dart';
import 'package:posts_test/domain/repositories/posts_repository.dart';
import 'package:posts_test/domain/usecases/posts_usecases.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  // Регистрация DS
  final dio = getIt.get<Dio>();
  final sharedPreferences = await getIt.getAsync<SharedPreferences>();

  getIt.registerSingleton<PostsRDS>(PostsRDSImpl(dio: dio));
  getIt.registerSingleton<CommentsLDS>(CommentsLDSImpl(sharedPreferences: sharedPreferences));

  // Регистрация репозиториев
  final postsRDS = getIt.get<PostsRDS>();
  final commentsLDS = getIt.get<CommentsLDS>();

  getIt.registerSingleton<PostsRepository>(
      PostsRepositiryImpl(postsRDS: postsRDS, commentsLDS: commentsLDS));

  // Регистрация usecases
  final postsRepository = getIt.get<PostsRepository>();

  getIt.registerSingleton<PostsUsecases>(
      PostsUsecases(repository: postsRepository));
}
