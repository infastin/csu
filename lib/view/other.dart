import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/widgets.dart';
import '../repo/repo.dart';
import 'no_data_body.dart';

part 'settings.dart';
part 'timetable.dart';
part 'about.dart';
part 'license.dart';

class OtherView extends StatefulWidget {
  const OtherView({
    super.key,
    this.initialIndex = 0,
  });

  final int initialIndex;

  @override
  State<OtherView> createState() => _OtherViewState();
}

class _OtherViewState extends State<OtherView> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialIndex
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final tabs = <(String, Widget)>[
      (loc.timetable, const _TimetableBody()),
      (loc.settings, const _SettingsBody()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.other),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e.$1)).toList()
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) => e.$2).toList()
      ),
    );
  }
}
