import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/tabs/quran/sura_details_args.dart';
import '../../utils/app_theme.dart';

class SuraContentScreen extends StatelessWidget {
  static const String routeName = '/suraContentScreen';

  List<String> ayat = [
    'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم',
    'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
    'الرَّحْمَنِ الرَّحِيمِ',
    'مَالِكِ يَوْمِ الدِّينِ',
    'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِين',
    'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيم',
    'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّين'
  ];
  late SuraDetailsArgs args;

  SuraContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    loadSuraFile();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/default_bg.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إسلامي'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: height * 0.02),
          margin: EdgeInsets.only(
              top: height * 0.02,
              bottom: height * 0.02,
              left: width * 0.07,
              right: width * 0.07),
          height: height * 0.74,
          width: width * 0.86,
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    args.suraName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_circle,
                      size: 27,
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 1,
                indent: width * 0.10,
                endIndent: width * 0.10,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(
                      textAlign: TextAlign.center,
                      ayat[index],
                      style: Theme.of(context).textTheme.titleLarge,
                    );
                  },
                  itemCount: ayat.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadSuraFile() {}
}
