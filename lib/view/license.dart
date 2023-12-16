part of 'other.dart';

class LicenseView extends StatelessWidget {
  const LicenseView({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.license)),
      body: const _LicenseBody(),
    );
  }
}

class _LicenseBody extends StatelessWidget {
  const _LicenseBody({super.key});

  @override
  Widget build(BuildContext context) {
    final appInfo = Provider.of<AppInfoProvider>(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            appInfo.appLicenseText,
            style: textTheme.labelMedium?.copyWith(
              fontFamily: "monospace"
            ),
          )
        )
      ],
    );
  }
}
