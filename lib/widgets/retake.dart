import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../utils/utils.dart';
import '../entity/entity.dart';
import '../repo/repo.dart';

class RetakeWidget extends StatelessWidget {
  const RetakeWidget({
    super.key,
    required this.retake
  });

  final RetakeEntity retake;

  static const _dot = Text("•", textAlign: TextAlign.center);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var colorScheme = theme.colorScheme;
    var prefProvider = Provider.of<PreferencesProvider>(context);
    var dateFormat = DateFormat("EEEE, d MMM y", prefProvider.locale.toString());

    var room = retake.room;
    Uri? uri;

    if (room.startsWith("Discord;")) {
      final parts = room.split(";");
      uri = Uri.tryParse(parts.sublist(1).join());
      room = parts[0];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            dateFormat.format(retake.date).capitalize(),
            style: textTheme.titleMedium,
          )
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "#${retake.number}",
                      style: textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                      child: _dot,
                    ),
                    Text(
                      retake.timeRange.format(context),
                      style: textTheme.labelLarge,
                    ),
                    const SizedBox(
                      width: 12,
                      child: _dot,
                    ),
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
            )
          )
        )
      ]
    );
  }
}
