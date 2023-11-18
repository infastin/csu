import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../entity/entity.dart';
import 'dot.dart';

class SubjectWidget extends StatelessWidget {
  const SubjectWidget({
    super.key,
    required this.subject,
  });

  final SubjectEntity subject;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var colorScheme = theme.colorScheme;
    var loc = AppLocalizations.of(context)!;

    var room = subject.room;
    Uri? uri;

    if (room.contains(";")) {
      final parts = room.split(";");
      uri = Uri.tryParse(parts.sublist(1).join());
      room = parts[0];
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "#${subject.number}",
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            const Dot(width: 12),
            Text(
              subject.timeRange.format(context),
              style: textTheme.labelLarge,
            ),
            const Dot(width: 12),
            if (uri != null) RichText(
              text: TextSpan(
                text: room,
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary.withOpacity(0.7),
                ),
                recognizer: TapGestureRecognizer()..onTap = () {
                  launchUrl(uri!);
                }
              )
            ) else Text(
              room,
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
