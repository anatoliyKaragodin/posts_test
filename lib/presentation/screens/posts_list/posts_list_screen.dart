import 'package:flutter/material.dart';
import 'package:posts_test/domain/entities/mapper/entities_mapper.dart';
import 'package:posts_test/presentation/screens/posts_list/posts_list_vm.dart';
import 'package:shimmer/shimmer.dart';


class PostsListScreen extends StatelessWidget {
  const PostsListScreen({super.key, required this.vm});

  final IPostsListVM vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<PostEntity>>(
        stream: vm.postsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildShimmerEffect();
          }

          if (snapshot.hasError) {
            // return _buildShimmerEffect();
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No posts available'));
          }

          final posts = snapshot.data!;

          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Card(
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (post.imageUrl.isNotEmpty)
                        Image.network(
                          post.imageUrl,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 200,
                              color: Colors.grey,
                              child: const Center(child: Text('Image not available')),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ??
                                            1)
                                    : null,
                              ),
                            );
                          },
                        )
                      else
                        Container(
                          height: 600,
                          color: Colors.grey,
                          child: const Center(child: Text('No Image')),
                        ),
                      const SizedBox(height: 10),
                      Text(post.body),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildShimmerEffect() {
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
                    children: List.generate(8, (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 10,
                    ),
                  ),
                  ),)
                ],
              ),
            ));
      },
    );
  }
}
