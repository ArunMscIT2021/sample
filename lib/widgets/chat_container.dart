import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/job_colors.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    Key? key,
    required this.text,
    required this.isCurrentUser,
  }) : super(key: key);
  final String text;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // asymmetric padding
      padding: EdgeInsets.fromLTRB(
        isCurrentUser ? 64.0 : 16.0,
        4,
        isCurrentUser ? 16.0 : 64.0,
        4,
      ),
      child: Align(
        // align the child within the container
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: DecoratedBox(
          // chat bubble decoration
          decoration: BoxDecoration(
            color: isCurrentUser ? JobColors.blue : JobColors.lightText,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: isCurrentUser ? JobColors.white : JobColors.gray),
            ),
          ),
        ),
      ),
    );
  }
}
