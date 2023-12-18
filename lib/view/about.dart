part of 'other.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.about)),
      body: const _AboutBody(),
    );
  }
}

class _AboutBody extends StatelessWidget {
  const _AboutBody({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final appInfo = Provider.of<AppInfoProvider>(context);

    return ListView(
      children: [
        ListTile(
          title: Text(loc.version),
          subtitle: Text(appInfo.packageInfo.version),
          leading: const Icon(Icons.info),
        ),
        ListTile(
          title: Text(loc.license),
          subtitle: Text(appInfo.appLicenseName),
          leading: const Icon(Icons.description),
          onTap: () => GoRouter.of(context).go("/settings/about/license"),
        ),
        ListTile(
          title: Text(loc.thirdPartyLicenses),
          leading: const Icon(Icons.pages),
          onTap: () => showLicensePage(
            context: context,
            applicationName: appInfo.packageInfo.appName,
            applicationVersion: appInfo.packageInfo.version,
          ),
        ),
        ListTile(
          title: Text(loc.sourceCode),
          subtitle: Text(appInfo.appSourceUrl),
          leading: const Icon(Icons.code),
          onTap: () => launchUrlString(appInfo.appSourceUrl),
        ),
      ],
    );
  }
}
