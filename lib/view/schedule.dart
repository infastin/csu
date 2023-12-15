import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/widgets.dart';
import '../utils/utils.dart';
import '../repo/repo.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    var loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.schedule)),
      body: const _ScheduleBody(),
    );
  }
}

class _ScheduleBody extends StatelessWidget {
  const _ScheduleBody({super.key});

  Future<void> getSchedule(BuildContext context, bool force) async {
    var grpc = Provider.of<GrpcProvider>(context, listen: false);
    var cache = Provider.of<CacheProvider>(context, listen: false);
    var prefs = Provider.of<PreferencesProvider>(context, listen: false);
    var loc = AppLocalizations.of(context)!;
    var scaffoldMessenger = ScaffoldMessenger.of(context);
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    var textStyle = DefaultTextStyle.of(context).style;

    if (cache.schedule != null && !force) {
      return;
    }

    try {
      var newSchedule = await grpc.getSchedule(prefs.group);
      cache.setSchedule(newSchedule);
    } on GrpcException catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(
            e.localize(loc),
            style: textStyle.copyWith(
              color: colorScheme.onError,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: colorScheme.error,
          showCloseIcon: true,
          closeIconColor: colorScheme.onError,
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var cache = Provider.of<CacheProvider>(context);

    getSchedule(context, false);

    late final Widget body;
    if (cache.schedule != null && cache.schedule!.isNotEmpty) {
      body = const _ScheduleBodyList();
    } else {
      body = const _ScheduleBodyNone();
    }

    return RefreshIndicator(
      onRefresh: () async => await getSchedule(context, true),
      child: body,
    );
  }
}

class _ScheduleBodyList extends StatefulWidget {
  const _ScheduleBodyList({super.key});

  @override
  State<_ScheduleBodyList> createState() => _ScheduleBodyListState();
}

class _ScheduleBodyListState extends State<_ScheduleBodyList> {
  int _selectedWeek = DateTime.now().isoWeekNumber.isOdd ? 0 : 1;

  @override
  Widget build(BuildContext context) {
    var cache = Provider.of<CacheProvider>(context);
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var colorScheme = theme.colorScheme;
    var loc = AppLocalizations.of(context)!;
    var days = cache.schedule!.getWeek(_selectedWeek);

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

class _ScheduleBodyNone extends StatelessWidget {
  const _ScheduleBodyNone({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var colorScheme = theme.colorScheme;
    var loc = AppLocalizations.of(context)!;

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Text(
              loc.noSchedule,
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onBackground.withOpacity(0.7),
              )
            ),
          )
        )
      ],
    );
  }
}
