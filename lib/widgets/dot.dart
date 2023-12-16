import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  const Dot({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      height: height,
      child: Text(
        "•",
        style: theme.textTheme.labelLarge?.copyWith(
          color: theme.dividerColor
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
