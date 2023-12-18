import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/widgets.dart';
import '../repo/repo.dart';
import 'no_data_body.dart';
import 'no_group_body.dart';

class RetakesView extends StatelessWidget {
  const RetakesView({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.retakes)),
      body: const _RetakesBody(),
    );
  }
}

class _RetakesBody extends StatelessWidget {
  const _RetakesBody({super.key});

  Future<void> updateRetakes(BuildContext context, bool force) async {
    final grpc = Provider.of<GrpcProvider>(context, listen: false);
    final cache = Provider.of<CacheProvider>(context, listen: false);
    final prefs = Provider.of<PreferencesProvider>(context, listen: false);
    final loc = AppLocalizations.of(context)!;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textStyle = DefaultTextStyle.of(context).style;

    if (prefs.group.isEmpty || (cache.retakes != null && !force)) {
      return;
    }

    try {
      final newRetakes = await grpc.getRetakes(prefs.group);
      cache.setRetakes(newRetakes);
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
    final prefs = Provider.of<PreferencesProvider>(context);
    final loc = AppLocalizations.of(context)!;

    updateRetakes(context, false);

    late final Widget body;
    if (prefs.group.isEmpty) {
      body = const NoGroupBody();
    } else if (cache.retakes == null || cache.retakes!.isEmpty) {
      body = NoDataBody(message: loc.noRetakes);
    } else {
      body = const _RetakesBodyList();
    }

    return RefreshIndicator(
      child: body,
      onRefresh: () async => await updateRetakes(context, true),
    );
  }
}

class _RetakesBodyList extends StatelessWidget {
  const _RetakesBodyList({super.key});

  @override
  Widget build(BuildContext context) {
    final cache = Provider.of<CacheProvider>(context);

    return ListView.builder(
      itemCount: cache.retakes!.retakes.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8),
        child: RetakeWidget(retake: cache.retakes!.retakes[index]),
      )
    );
  }
}
