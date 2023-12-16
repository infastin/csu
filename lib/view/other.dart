import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/widgets.dart';
import '../repo/repo.dart';

part 'settings.dart';
part 'timetable.dart';
part 'about.dart';
part 'license.dart';

class OtherView extends StatelessWidget {
  const OtherView({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final tabs = <(String, Widget)>[
      (loc.timetable, const _TimetableBody()),
      (loc.settings, const _SettingsBody()),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(loc.other),
          bottom: TabBar(
            tabs: [
              for (final tab in tabs) Tab(
                text: tab.$1,
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (final tab in tabs) tab.$2
          ],
        ),
      ),
    );
  }
}
