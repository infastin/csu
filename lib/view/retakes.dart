import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../repo/data.dart' as data;
import '../widgets/widgets.dart';
import '../entity/entity.dart';

class RetakesView extends StatelessWidget {
  RetakesView({super.key});

  final List<RetakeEntity>? retakes = data.retakes;

  @override
  Widget build(BuildContext context) {
    if (retakes == null || retakes!.isEmpty) {
      return const _NoRetakes();
    }

    return ListView.builder(
      itemCount: retakes!.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8),
        child: RetakeWidget(retake: retakes![index]),
      )
    );
  }
}

class _NoRetakes extends StatelessWidget {
  const _NoRetakes({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var colorScheme = theme.colorScheme;
    var loc = AppLocalizations.of(context)!;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      child: Text(
        loc.noRetakes,
        style: textTheme.titleLarge?.copyWith(
          color: colorScheme.onBackground.withOpacity(0.7),
        )
      ),
    );
  }
}
