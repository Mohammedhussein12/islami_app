import 'package:flutter/material.dart';
import 'package:islami/tabs/sebha/sebha_provider.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/app_theme.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => SebhaProvider(),
        child: Consumer<SettingsProvider>(
          builder: (context, settingsProvider, _) {
            return Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: settingsProvider.isDark
                          ? Image.asset(
                        fit: BoxFit.fill,
                        'assets/images/head_sebha_dark.png',
                        height: height * 0.12,
                        width: width * 0.17,
                      )
                          : Image.asset(
                        fit: BoxFit.fill,
                        'assets/images/head_sebha_logo.png',
                        height: height * 0.12,
                        width: width * 0.17,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.09),
                      child: Consumer<SebhaProvider>(
                        builder: (context, sebhaProvider, child) {
                          return GestureDetector(
                            onTap: () {
                              sebhaProvider.rotateSebha();
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Transform.rotate(
                                angle: sebhaProvider.angle * 3.14 / 180,
                                child: settingsProvider.isDark
                                    ? Image.asset(
                                  fit: BoxFit.fill,
                                  'assets/images/body_sebha_dark.png',
                                  height: height * 0.26,
                                  width: width * 0.56,
                                )
                                    : Image.asset(
                                  fit: BoxFit.fill,
                                  'assets/images/body_sebha_logo.png',
                                  height: height * 0.26,
                                  width: width * 0.56,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  AppLocalizations.of(context)!.sebha_count,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  height: height * 0.12,
                  width: width * 0.22,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Consumer<SebhaProvider>(
                      builder: (context, sebhaProvider, child) => Text(
                        sebhaProvider.sebhaCount.toString(),
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  height: height * 0.07,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                    color: settingsProvider.isDark
                        ? AppTheme.gold
                        : AppTheme.lightPrimary,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Consumer<SebhaProvider>(
                      builder: (context, sebhaProvider, child) => Text(
                        sebhaProvider.sebhaWord,
                        style: settingsProvider.isDark
                            ? Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.black)
                            : Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
