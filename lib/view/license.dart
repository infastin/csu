part of 'other.dart';

class LicenseView extends StatelessWidget {
  const LicenseView({super.key});

  @override
  Widget build(BuildContext context) {
    var loc = AppLocalizations.of(context)!;
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
    var appInfo = Provider.of<AppInfoProvider>(context);
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

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
