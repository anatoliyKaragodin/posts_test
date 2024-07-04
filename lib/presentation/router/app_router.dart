import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:posts_test/presentation/screens/post_details/post_datail_bloc.dart';
import 'package:posts_test/presentation/screens/posts_list/posts_list_bloc.dart';
import 'package:posts_test/presentation/screens/posts_list/posts_list_screen.dart';

import '../screens/post_details/post_details_screen.dart';

class RouterHelper {
  static final RouterHelper _instance = RouterHelper._internal();

  static RouterHelper get instance => _instance;

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  static const String postsListsPath = '/posts_list';
  static const String postDeatailsPath = '/post_details';

  factory RouterHelper() {
    return _instance;
  }

  RouterHelper._internal() {
    final routes = [
      // Экран листа постов
      GoRoute(
          path: postsListsPath,
          pageBuilder: (context, state) {
            return getPage(
                child: PostsListScreen(
                  postsListBloc: PostsListBloc(),
                ),
                state: state);
          }),
      // Экран детализорованного поста с комменатриями
      GoRoute(
          path: postDeatailsPath,
          pageBuilder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            return getPage(
                child: PostDetailsScreen(
                  postIndex: extra['postIndex'],
                  postDetailsBloc: PostDetailsBloc(),
                  postsListBloc: PostsListBloc(),
                ),
                state: state);
          }),
    ];

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: postsListsPath,
      routes: routes,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
