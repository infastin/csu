import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/widgets.dart';
import '../repo/repo.dart';

class RetakesView extends StatelessWidget {
  const RetakesView({super.key});

  @override
  Widget build(BuildContext context) {
    var loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.retakes)),
      body: const _RetakesBody(),
    );
  }
}

class _RetakesBody extends StatelessWidget {
  const _RetakesBody({super.key});

  Future<void> getRetakes(BuildContext context, bool force) async {
    var grpc = Provider.of<GrpcProvider>(context, listen: false);
    var cache = Provider.of<CacheProvider>(context, listen: false);
    var prefs = Provider.of<PreferencesProvider>(context, listen: false);
    var loc = AppLocalizations.of(context)!;
    var scaffoldMessenger = ScaffoldMessenger.of(context);
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    var textStyle = DefaultTextStyle.of(context).style;

    if (cache.retakes != null && !force) {
      return;
    }

    try {
      var newRetakes = await grpc.getRetakes(prefs.group);
      cache.setRetakes(newRetakes);
    } on GrpcException catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(
            "${e.providerCode.localize(loc)}: ${e.grpcCode.localize(loc)}",
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

    getRetakes(context, false);

    late final Widget body;
    if (cache.retakes != null) {
      body = const _RetakesBodyList();
    } else {
      body = const _RetakesBodyNone();
    }

    return RefreshIndicator(
      onRefresh: () async => await getRetakes(context, true),
      child: body,
    );
  }
}

class _RetakesBodyList extends StatelessWidget {
  const _RetakesBodyList({super.key});

  @override
  Widget build(BuildContext context) {
    var cache = Provider.of<CacheProvider>(context);

    return ListView.builder(
      itemCount: cache.retakes!.retakes.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8),
        child: RetakeWidget(retake: cache.retakes!.retakes[index]),
      )
    );
  }
}

class _RetakesBodyNone extends StatelessWidget {
  const _RetakesBodyNone({super.key});

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
              loc.noRetakes,
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onBackground.withOpacity(0.7),
              )
            ),
          ),
        ),
      ],
    );
  }
}
