import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class NoDataBody extends StatelessWidget {
  const NoDataBody({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return CenterFillScrollWidget(
      child: Text(
        message,
        style: textTheme.titleLarge?.copyWith(
          color: colorScheme.onBackground.withOpacity(0.7),
        )
      ),
    );
  }
}
