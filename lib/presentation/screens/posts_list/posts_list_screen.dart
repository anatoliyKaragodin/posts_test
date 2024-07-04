import 'package:flutter/material.dart';
import 'package:posts_test/domain/entities/mapper/entities_mapper.dart';
import 'package:posts_test/presentation/screens/posts_list/posts_list_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../widgets/common/app_error_widget.dart';
import '../../widgets/posts_list/post_widget.dart';
import 'posts_list_events.dart';

class PostsListScreen extends StatelessWidget {
  const PostsListScreen({super.key, required this.postsListBloc});

  final IPostsListBloc postsListBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<PostEntity>>(
        stream: postsListBloc.postsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const _ShimmerWidget();
          }

          if (snapshot.hasError) {
            return AppErrorWidget(errorText: snapshot.error.toString());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No posts available'));
          }

          final posts = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: PostWidget(
                    post: post,
                    onTap: () => postsListBloc.eventSink.add(
                        GoToPostDetails(postIndex: index, postId: post.id)),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _ShimmerWidget extends StatelessWidget {
  const _ShimmerWidget();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            enabled: true,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 300,
                    ),
                  ),
                  Column(
                    children: List.generate(
                      8,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Container(
                          color: Colors.white,
                          width: double.infinity,
                          height: 10,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
