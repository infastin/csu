import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/widgets.dart';

class NoGroupBody extends StatelessWidget {
  const NoGroupBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final loc = AppLocalizations.of(context)!;

    return CenterFillScrollWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            loc.groupNotSelected,
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.onBackground.withOpacity(0.7),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(textStyle: textTheme.titleMedium!),
            onPressed: () => GoRouter.of(context).go("/settings"),
            child: Text(loc.goToSettings),
          ),
        ],
      ),
    );
  }
}
