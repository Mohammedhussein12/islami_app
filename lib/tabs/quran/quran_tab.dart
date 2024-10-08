import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/quran_item.dart';
import 'package:islami/tabs/quran/sura_content_screen.dart';
import 'package:islami/tabs/quran/sura_details_args.dart';

import '../../controllers/sura_controller.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
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
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 3),
            ),
            width: double.infinity,
            height: height * 0.13,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    'عدد الآيات',
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
                    'إسم السورة',
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
                      child: QuranItem(
                        item: suraController.versesNumber[index].toString(),
                      ),
                    ),
                    const VerticalDivider(),
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
