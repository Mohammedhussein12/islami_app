import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/quran_item.dart';
import 'package:islami/tabs/quran/sura_content_screen.dart';
import 'package:islami/tabs/quran/sura_details_args.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../controllers/sura_controller.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    final SuraController suraController = SuraController();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            "assets/images/qur2an_screen_logo.png",
            height: height * 0.25,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                  width: 3),
            ),
            width: double.infinity,
            height: height * 0.13,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    AppLocalizations.of(context)!.sura_name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    AppLocalizations.of(context)!.verses_number,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: suraController.suraNames.length,
              itemBuilder: (context, index) => IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            SuraDetailsScreen.routeName,
                            arguments: SuraDetailsArgs(
                                suraName: suraController.suraNames[index],
                                index: index),
                          );
                        },
                        child: QuranItem(
                          item: suraController.suraNames[index],
                        ),
                      ),
                    ),
                    const VerticalDivider(),
                    Expanded(
                      child: QuranItem(
                        item: suraController.versesNumber[index].toString(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
