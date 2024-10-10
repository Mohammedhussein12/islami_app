import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_theme.dart';
import '../settings/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: height * 0.16),
          Image.asset(
            'assets/images/radio_image.png',
            height: height * 0.25,
          ),
          SizedBox(height: height * 0.06),
          Text(AppLocalizations.of(context)!.holy_quran_radio,
              style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: height * 0.06),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  color: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                  settingsProvider.isDark
                      ? const AssetImage(
                          'assets/images/Icon metro-previous_gold.png')
                      : const AssetImage(
                          'assets/images/Icon metro-previous.png'),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  color: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                  settingsProvider.isDark
                      ? const AssetImage(
                          'assets/images/Icon awesome-play_gold.png')
                      : const AssetImage('assets/images/Icon awesome-play.png'),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  color: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                  settingsProvider.isDark
                      ? const AssetImage(
                          'assets/images/Icon metro-next_gold.png')
                      : const AssetImage('assets/images/Icon metro-next.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
