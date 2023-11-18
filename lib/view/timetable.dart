part of 'other.dart';

class _TimetableBody extends StatelessWidget {
  const _TimetableBody({super.key});

  final timeRanges = data.timeRanges;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            child: Column(
              children: [
                for (var i = 0; i < timeRanges.length; ++i) ...[
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
                        Text(timeRanges[i].format(context)),
                      ]
                    )
                  )
                ]
              ],
            ),
          ),
        )
      ],
    );
  }
}
