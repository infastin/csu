import 'package:csu/entity/day.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../entity/entity.dart';
import '../widgets/widgets.dart';

class DayWidget extends StatelessWidget {
  DayWidget({
    super.key,
    required this.day,
    required this.startDate,
  });

  final DayEntity day;
  final DateTime startDate;
  final DateFormat _dateFormat = DateFormat("EEEE, d MMM y");

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var date = startDate.add(Duration(days: day.weekday));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            _dateFormat.format(date),
            style: textTheme.titleMedium,
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
