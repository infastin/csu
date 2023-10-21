import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/widgets.dart';
import '../repo/data.dart' as data;
import '../utils/utils.dart';

class ScheduleView extends StatefulWidget {
  ScheduleView({super.key});

  final days = [data.oddDays, data.evenDays];

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  int _selectedWeek = isoWeekNumber(DateTime.now()).isOdd ? 0 : 1;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var colorScheme = theme.colorScheme;
    var days = widget.days[_selectedWeek];
    var loc = AppLocalizations.of(context)!;

    return ListView.builder(
      itemCount: days.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          var labels = [loc.odd, loc.even];

          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text("${loc.week}:"),
                for (int i = 0; i < labels.length; ++i) ChoiceChip(
                  label: Text(labels[i]),
                  labelStyle: textTheme.titleSmall?.copyWith(
                    color: (_selectedWeek == i) ? colorScheme.onSecondary : colorScheme.onSurface
                  ),
                  selectedColor: colorScheme.secondary,
                  showCheckmark: false,
                  selected: _selectedWeek == i,
                  onSelected: (bool selected) {
                    setState(() => _selectedWeek = selected ? i : _selectedWeek);
                  }
                )
              ]
            )
          );
        }

        var now = DateTime.now();
        var realWeek = isoWeekNumber(now).isOdd ? 0 : 1;

        var startDate = now.subtract(Duration(days: now.weekday));
        if (realWeek != _selectedWeek) {
          startDate = startDate.add(const Duration(days: 7));
        }

        return Padding(
          padding: const EdgeInsets.all(8),
          child: DayWidget(day: days[index-1], startDate: startDate)
        );
      },
    );
  }
}
