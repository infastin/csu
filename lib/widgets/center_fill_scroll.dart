import 'package:flutter/material.dart';

class CenterFillScrollWidget extends StatelessWidget {
  const CenterFillScrollWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: child,
          ),
        ),
      ],
    );
  }
}
