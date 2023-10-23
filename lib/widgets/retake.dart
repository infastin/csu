import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../utils/utils.dart';
import '../entity/entity.dart';
import '../repo/repo.dart';

import 'dot.dart';

class RetakeWidget extends StatelessWidget {
  const RetakeWidget({
    super.key,
    required this.retake
  });

  final RetakeEntity retake;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var prefProvider = Provider.of<PreferencesProvider>(context);
    var dateFormat = DateFormat("EEEE, d MMM y", prefProvider.locale.toString());

    var dateTheme = textTheme.titleMedium;
    if (DateTime.now().dateOnly() == retake.date.dateOnly()) {
      dateTheme = dateTheme?.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.bold,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            dateFormat.format(retake.date).capitalize(),
            style: dateTheme,
          )
        ),
        Card(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: _RetakeBody(retake: retake)
            )
          )
        )
      ]
    );
  }
}

class _RetakeBody extends StatelessWidget {
  const _RetakeBody({
    super.key,
    required this.retake
  });

  final RetakeEntity retake;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var colorScheme = theme.colorScheme;

    var room = retake.room;
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
              "#${retake.number}",
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            const Dot(),
            Text(
              retake.timeRange.format(context),
              style: textTheme.labelLarge,
            ),
            const Dot(),
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
          retake.name,
          style: textTheme.labelLarge,
        ),
        const SizedBox(height: 4),
        Text(
          retake.lecturer.toString(),
          style: textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
        )
      ],
    );
  }
}
