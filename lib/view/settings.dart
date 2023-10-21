import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../repo/repo.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var loc = AppLocalizations.of(context)!;
    var adaptiveTheme = AdaptiveTheme.of(context);
    var prefProvider = Provider.of<PreferencesProvider>(context);

    var themesMap = {
      AdaptiveThemeMode.system: loc.systemTheme,
      AdaptiveThemeMode.light: loc.lightTheme,
      AdaptiveThemeMode.dark: loc.darkTheme,
    };

    var languagesMap = {
      const Locale("ru"): "Русский",
      const Locale("en"): "English",
    };

    return ListView(
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
          title: loc.other,
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
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

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
    var adaptiveTheme = AdaptiveTheme.of(context);
    var loc = AppLocalizations.of(context)!;

    var themes = [
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
    var loc = AppLocalizations.of(context)!;
    var prefProvider = Provider.of<PreferencesProvider>(context);

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
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loc = AppLocalizations.of(context)!;
    var prefProvider = Provider.of<PreferencesProvider>(context);

    if (prefProvider.group.isNotEmpty) {
      controller.text = prefProvider.group;
    }

    return SimpleDialog(
      title: Text(loc.group),
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: Text(loc.group),
                  ),
                  controller: controller,
                )
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
                          prefProvider.setGroup(controller.text);
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
