import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../domain/entities/mapper/entities_mapper.dart';
import '../common/image_remote_widget.dart';

/// Виджет поста
class PostWidget extends StatelessWidget {
  const PostWidget(
      {super.key,
      required this.post,
      required this.onTap});

  final PostEntity post;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (post.imageUrl.isNotEmpty)
                ImageRemoteWidget(imgUrl: post.imageUrl)
              else
                Container(
                  height: 600,
                  color: Colors.grey,
                  child: const Center(child: Text('No Image')),
                ),
              const Gap(10),
              Text(post.body),
            ],
          ),
        ),
      ),
    );
  }
}