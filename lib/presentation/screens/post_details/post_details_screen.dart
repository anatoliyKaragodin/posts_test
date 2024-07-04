// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:posts_test/domain/entities/mapper/entities_mapper.dart';
import 'package:posts_test/presentation/screens/post_details/post_datail_bloc.dart';
import 'package:posts_test/presentation/widgets/common/image_remote_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../widgets/common/app_error_widget.dart';
import '../../widgets/post_details/comment_widget.dart';
import '../posts_list/posts_list_bloc.dart';
import 'post_details_events.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen(
      {super.key,
      required this.postIndex,
      required this.postsListBloc,
      required this.postDetailsBloc});
  final int postIndex;

  final IPostsListBloc postsListBloc;
  final IPostDetailsBloc postDetailsBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => postDetailsBloc.eventSink.add(GoToPostsList()),
            child: const BackButtonIcon()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: StreamBuilder<List<PostEntity>>(
                stream: postsListBloc.postsStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return AppErrorWidget(errorText: snapshot.error.toString());
                  }
                  if (snapshot.data != null) {
                    final post = snapshot.data![postIndex];
                    final comments = post.comments;

                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            post.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Gap(10),
                          ImageRemoteWidget(imgUrl: post.imageUrl),
                          Gap(10),
                          Text(post.body),
                          Gap(10),
                          Text('Comments:'),
                          Gap(10),
                          if (post.comments.isNotEmpty)
                            Column(
                                children: List.generate(comments.length,
                                    (commentIndex) {
                              return CommentWidget(
                                  comment: post.comments[commentIndex]);
                            })),
                          if (post.comments.isEmpty) _ShimmerWidget()
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                })),
      ),
    );
  }
}

class _ShimmerWidget extends StatelessWidget {
  const _ShimmerWidget();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
            30,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: 10,
              ),
            ),
          ),
        ));
  }
}
