import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/settings_page/widgets/language_widgets.dart';
import 'package:todo_app/pages/settings_page/widgets/mode_widgets.dart';
import 'package:todo_app/provider/setting_provider.dart';
import 'package:todo_app/shared_components/theme/theme/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style:
                theme.textTheme.bodyMedium?.copyWith(color: theme.accentColor),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showBottomLanguageSheet(context);
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: theme.primaryColor,
                  border: Border.all(
                      color: primaryColor, style: BorderStyle.solid)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    settingsProvider.currentLocal == "en"
                        ? AppLocalizations.of(context)!.languageEnglish
                        : AppLocalizations.of(context)!.languageArabic,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: primaryColor),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 33,
                    color: primaryColor,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Text(
            AppLocalizations.of(context)!.thememode,
            style:
                theme.textTheme.bodyMedium?.copyWith(color: theme.accentColor),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showBottomModeSheet(context);
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: theme.primaryColor,
                  border: Border.all(
                      color: primaryColor, style: BorderStyle.solid)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    settingsProvider.currentTheme == ThemeMode.light
                        ? AppLocalizations.of(context)!.themeLight
                        : AppLocalizations.of(context)!.themeDark,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: primaryColor),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 33,
                    color: primaryColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showBottomModeSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) => ModeWidget());
  }

  void showBottomLanguageSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageWidget());
  }
}
