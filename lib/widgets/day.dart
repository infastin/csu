import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../entity/entity.dart';
import '../widgets/widgets.dart';
import '../repo/repo.dart';
import '../utils/utils.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({
    super.key,
    required this.day,
    required this.startDate,
  });

  final DayEntity day;
  final DateTime startDate;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var date = startDate.add(Duration(days: day.weekday));
    var prefProvider = Provider.of<PreferencesProvider>(context);
    var dateFormat = DateFormat("EEEE, d MMM y", prefProvider.locale.toString());

    var dateTheme = textTheme.titleMedium;
    if (DateTime.now().dateOnly() == date.dateOnly()) {
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
            dateFormat.format(date).capitalize(),
            style: dateTheme,
          )
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < day.subjects.length; ++i) ...[
                i != 0 ? const Divider(height: 8, thickness: 0.5) : Container(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SubjectWidget(subject: day.subjects[i])
                )
              ]
            ]
          )
        )
      ],
    );
  }
}
