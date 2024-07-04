import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../domain/entities/mapper/entities_mapper.dart';

/// Виджет комментария
class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.comment,
  });

  final CommentEntity comment;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Text('comment №${comment.id}'),
            // const Gap(10),
            const Align(alignment: Alignment.centerLeft, child: Text('from:')),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  comment.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            const Gap(10),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'email: ${comment.email}',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                )),
            const Gap(10),
            Text(
              comment.body,
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    ));
  }
}
