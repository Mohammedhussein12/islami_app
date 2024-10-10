import 'package:flutter/material.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/app_theme.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int sebhaCount = 0;
  String sebhaWord = 'سبحان الله';
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Column(
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
                child: GestureDetector(
                  onTap: () {
                    rotateSebha();
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Transform.rotate(
                      angle: angle * 3.14 / 180,
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
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Text(
            'عدد التسبيحات',
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
              child: Text(
                sebhaCount.toString(),
                style: Theme.of(context).textTheme.headlineSmall,
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
              color: settingsProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                sebhaWord,
                style: settingsProvider.isDark?Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.black):Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void rotateSebha() {
    angle += 20;
    sebhaCount = sebhaCount + 1;
    int cycleCount = sebhaCount % 99;
    if (cycleCount <= 33 && cycleCount > 0) {
      sebhaWord = 'سبحان الله';
    } else if (cycleCount > 33 && cycleCount <= 66) {
      sebhaWord = 'الحمد لله';
    } else if (cycleCount > 66 && cycleCount <= 99) {
      sebhaWord = 'الله اكبر';
    }

    setState(() {});
  }
}
