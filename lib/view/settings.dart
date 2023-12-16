part of 'other.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.settings)),
      body: const _SettingsBody(),
    );
  }
}

class _SettingsBody extends StatelessWidget {
  const _SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final adaptiveTheme = AdaptiveTheme.of(context);
    final prefProvider = Provider.of<PreferencesProvider>(context);

    final themesMap = {
      AdaptiveThemeMode.system: loc.systemTheme,
      AdaptiveThemeMode.light: loc.lightTheme,
      AdaptiveThemeMode.dark: loc.darkTheme,
    };

    final languagesMap = {
      const Locale("ru"): "Русский",
      const Locale("en"): "English",
    };

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 4),
      children: [
        _SettingsSection(
          title: loc.appearance,
          children: [
            _SettingsTile(
              title: Text(loc.theme),
              subtitle: Text(themesMap[adaptiveTheme.mode]!),
              icon: const Icon(Icons.brush),
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => const _ThemeDialog()
              ),
            ),
            _SettingsTile(
              title: Text(loc.language),
              subtitle: Text(languagesMap[prefProvider.locale]!),
              icon: const Icon(Icons.language),
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => const _LanguageDialog()
              ),
            ),
          ]
        ),
        _SettingsSection(
          title: loc.info,
          children: [
            _SettingsTile(
              title: Text(loc.group),
              subtitle: prefProvider.group.isNotEmpty ? Text(prefProvider.group) : null,
              icon: const Icon(Icons.group),
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => const _GroupDialog()
              ),
            )
          ]
        ),
        _SettingsSection(
          title: loc.other,
          children: [
            _SettingsTile(
              title: Text(loc.about),
              icon: const Icon(Icons.info),
              onTap: () => GoRouter.of(context).go("/other/about"),
            ),
          ],
        ),
      ],
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: textTheme.titleMedium,
          ),
        ),
        ...children,
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.onTap,
  });

  final Widget title;
  final Widget? subtitle;
  final Icon icon;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: subtitle,
      leading: icon,
      selected: false,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      onTap: onTap,
    );
  }
}

class _ThemeDialog extends StatelessWidget {
  const _ThemeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final adaptiveTheme = AdaptiveTheme.of(context);
    final loc = AppLocalizations.of(context)!;

    final themes = [
      (loc.systemTheme, AdaptiveThemeMode.system),
      (loc.lightTheme, AdaptiveThemeMode.light),
      (loc.darkTheme, AdaptiveThemeMode.dark),
    ];

    return SimpleDialog(
      title: Text(loc.theme),
      children: [
        for (final theme in themes) ListTile(
          title: Text(theme.$1),
          leading: Radio<AdaptiveThemeMode>(
            value: theme.$2,
            groupValue: adaptiveTheme.mode,
            onChanged: (AdaptiveThemeMode? _) => adaptiveTheme.setThemeMode(theme.$2),
          ),
          onTap: () => adaptiveTheme.setThemeMode(theme.$2),
        )
      ],
    );
  }
}

class _LanguageDialog extends StatelessWidget {
  const _LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final prefProvider = Provider.of<PreferencesProvider>(context);

    const locales = [
      ("English", Locale("en")),
      ("Русский", Locale("ru")),
    ];

    return SimpleDialog(
      title: Text(loc.language),
      children: [
        for (final locale in locales) ListTile(
          title: Text(locale.$1),
          leading: Radio<Locale>(
            value: locale.$2,
            groupValue: prefProvider.locale,
            onChanged: (Locale? _) => prefProvider.setLocale(locale.$2),
          ),
          onTap: () => prefProvider.setLocale(locale.$2)
        )
      ]
    );
  }
}

class _GroupDialog extends StatefulWidget {
  const _GroupDialog({super.key});

  @override
  State<_GroupDialog> createState() => _GroupDialogState();
}

class _GroupDialogState extends State<_GroupDialog> {
  final _formKey = GlobalKey<FormState>();
  final _groupDropdownKey = GlobalKey<DropdownSearchState<String>>();
  String? _errorMsg;

  Future<bool> updateGroups(BuildContext context) async {
    final grpc = Provider.of<GrpcProvider>(context, listen: false);
    final cache = Provider.of<CacheProvider>(context, listen: false);
    final loc = AppLocalizations.of(context)!;

    try {
      final newGroups = await grpc.getGroups();
      cache.setGroups(newGroups);
      return true;
    } on GrpcException catch (e) {
      setState(() {
        _errorMsg = e.localize(loc);
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final prefs = Provider.of<PreferencesProvider>(context);
    final cache = Provider.of<CacheProvider>(context);

    return SimpleDialog(
      title: Text(loc.group),
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: DropdownSearch<String>(
                  key: _groupDropdownKey,
                  items: cache.groups != null ? cache.groups!.groups : [],
                  popupProps: const PopupProps.menu(
                    showSearchBox: true,
                    showSelectedItems: true,
                  ),
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: Text(loc.group),
                      errorText: _errorMsg,
                      errorMaxLines: 2,
                    )
                  ),
                  onBeforePopupOpening: (_) async => await updateGroups(context),
                  selectedItem: prefs.group.isNotEmpty ? prefs.group : null,
                  validator: (value) => value == null ? loc.groupNotSelected : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(loc.cancel),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                      child: Text(loc.ok),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          prefs.setGroup(_groupDropdownKey.currentState!.getSelectedItem!);
                          Navigator.of(context).pop();
                        }
                      }
                    ),
                  ]
                ),
              )
            ]
          ),
        ),
      ],
    );
  }
}
