import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../provider/setting_provider.dart';
import '../../../shared_components/theme/color.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                settingsProvider.changeLocal("en");
              },
              child: settingsProvider.currentLocal == "en"
                  ? getSelectedItem(
                      context, AppLocalizations.of(context)!.languageEnglish)
                  : getUnSelectedItem(
                      context, AppLocalizations.of(context)!.languageEnglish)),
          const SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                settingsProvider.changeLocal("ar");
              },
              child: settingsProvider.currentLocal == "en"
                  ? getUnSelectedItem(
                      context, AppLocalizations.of(context)!.languageArabic)
                  : getSelectedItem(
                      context, AppLocalizations.of(context)!.languageArabic))
        ],
      ),
    );
  }

  Widget getSelectedItem(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          //  color: lightGreenColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primaryColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyMedium),
          Icon(
            Icons.check,
            color: primaryColor,
          )
        ],
      ),
    );
  }

  Widget getUnSelectedItem(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Theme.of(context).accentColor),
      ),
    );
  }
}
