import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../entity/entity.dart';

class SubjectWidget extends StatelessWidget {
  const SubjectWidget({
    super.key,
    required this.subject,
  });

  final SubjectEntity subject;

  static const _dot = Text("•", textAlign: TextAlign.center);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var colorScheme = theme.colorScheme;
    var loc = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "#${subject.number}",
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            const SizedBox(
              width: 12,
              child: _dot,
            ),
            Text(
              subject.timeRange.format(context),
              style: textTheme.labelLarge,
            ),
            const SizedBox(
              width: 12,
              child: _dot,
            ),
            Text(
              subject.room,
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subject.name,
          style: textTheme.labelLarge,
        ),
        const SizedBox(height: 4),
        Text(
          subject.type.localize(loc),
          style: textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subject.lecturer.toString(),
          style: textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
        )
      ],
    );
  }
}
