import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/tabs/quran/sura_content_list_view.dart';
import 'package:islami/tabs/quran/sura_details_args.dart';
import 'package:islami/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';
import '../../utils/app_theme.dart';
import '../settings/settings_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = '/suraContentScreen';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  late SuraDetailsArgs args;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: settingsProvider.isDark
              ? const AssetImage('assets/images/dark_bg.png')
              : const AssetImage('assets/images/default_bg.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إسلامي'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.01),
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.08,
            vertical: height * 0.02,
          ),
          height: height * 0.77,
          width: width * 0.86,
          decoration: BoxDecoration(
            color: settingsProvider.isDark
                ? AppTheme.darkPrimary.withOpacity(0.9)
                : AppTheme.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "سورة ${args.suraName}",
                    style: settingsProvider.isDark
                        ? Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontFamily: 'regular', color: AppTheme.gold)
                        : Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontFamily: 'regular', color: AppTheme.black),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      color: settingsProvider.isDark
                          ? AppTheme.gold
                          : AppTheme.black,
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
                child: ayat.isEmpty
                    ? const LoadingIndicator()
                    : SuraContentListView(ayat: ayat),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile() async {
    final String suraText =
        await rootBundle.loadString('assets/text/${args.index + 1}.txt');
    ayat = suraText.trim().split('\r\n');
    setState(() {});
  }
}
