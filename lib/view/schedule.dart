import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/widgets.dart';
import '../repo/data.dart' as data;
import '../utils/utils.dart';
import '../entity/entity.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    var loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.schedule)),
      body: _ScheduleBody(),
    );
  }
}

class _ScheduleBody extends StatefulWidget {
  _ScheduleBody({super.key});

  final ScheduleEntity? schedule = ScheduleEntity(
    oddWeek: data.oddDays,
    evenWeek: data.evenDays
  );

  // final ScheduleEntity? schedule = null;

  @override
  State<_ScheduleBody> createState() => _ScheduleBodyState();
}

class _ScheduleBodyState extends State<_ScheduleBody> {
  int _selectedWeek = DateTime.now().isoWeekNumber.isOdd ? 0 : 1;

  @override
  Widget build(BuildContext context) {
    if (widget.schedule == null) {
      return const _NoSchedule();
    }

    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var colorScheme = theme.colorScheme;
    var loc = AppLocalizations.of(context)!;
    var days = widget.schedule!.getWeek(_selectedWeek);

    return ListView.builder(
      itemCount: days.length + 1,
      itemBuilder: (context, index) {
        var now = DateTime.now();
        var realWeek = now.isoWeekNumber.isOdd ? 0 : 1;

        if (index == 0) {
          var labels = [loc.odd, loc.even];
          labels[realWeek] += " (${loc.current})";

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text("${loc.week}:")
                ),
                for (int i = 0; i < labels.length; ++i) Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: ChoiceChip(
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
                )
              ]
            )
          );
        }

        if (days.isEmpty) {
          return const _NoSchedule();
        }

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

class _NoSchedule extends StatelessWidget {
  const _NoSchedule({super.key});

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
        loc.noSchedule,
        style: textTheme.titleLarge?.copyWith(
          color: colorScheme.onBackground.withOpacity(0.7),
        )
      ),
    );
  }
}
