part of 'other.dart';

class _TimetableBody extends StatelessWidget {
  const _TimetableBody({super.key});

  Future<void> updateTimeTable(BuildContext context, bool force) async {
    final grpc = Provider.of<GrpcProvider>(context, listen: false);
    final cache = Provider.of<CacheProvider>(context, listen: false);
    final loc = AppLocalizations.of(context)!;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textStyle = DefaultTextStyle.of(context).style;

    if (cache.timetable != null && !force) {
      return;
    }

    try {
      final newTimeTable = await grpc.getTimeTable();
      cache.setTimeTable(newTimeTable);
    } on GrpcException catch (e) {
      scaffoldMessenger.showSnackBar(
        ErrorSnackBar.create(
          message: e.localize(loc),
          colorScheme: colorScheme,
          textStyle: textStyle
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cache = Provider.of<CacheProvider>(context);

    updateTimeTable(context, false);

    late final Widget body;
    if (cache.timetable != null && cache.timetable!.isNotEmpty) {
      body = const _TimetableBodyList();
    } else {
      body = const _TimetableBodyNone();
    }

    return RefreshIndicator(
      child: body,
      onRefresh: () async => await updateTimeTable(context, true),
    );
  }
}

class _TimetableBodyList extends StatelessWidget {
  const _TimetableBodyList({super.key});

  @override
  Widget build(BuildContext context) {
    final cache = Provider.of<CacheProvider>(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          child: Column(
            children: [
              for (var i = 0; i < cache.timetable!.timetable.length; ++i) ...[
                i != 0 ? const Divider(height: 8, thickness: 0.5) : Container(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text(
                        "#${i+1}",
                        style: textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.7)
                        ),
                      ),
                      const Dot(width: 12),
                      Text(cache.timetable!.timetable[i].format(context)),
                    ]
                  )
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _TimetableBodyNone extends StatelessWidget {
  const _TimetableBodyNone({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final loc = AppLocalizations.of(context)!;

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Text(
              loc.noTimeTable,
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
