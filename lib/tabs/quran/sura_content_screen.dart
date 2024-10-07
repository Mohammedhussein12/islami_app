import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/tabs/quran/sura_content_list_view.dart';
import 'package:islami/tabs/quran/sura_details_args.dart';
import 'package:islami/widgets/loading_indicator.dart';
import '../../utils/app_theme.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = '/suraContentScreen';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  late SuraDetailsArgs args;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
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
          padding: EdgeInsets.only(top: height * 0.02,bottom: height * 0.01),
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.08,
            vertical: height * 0.02,
          ),
          height: height * 0.77,
          width: width * 0.86,
          decoration: BoxDecoration(
            color: AppTheme.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "سورة ${args.suraName}",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontFamily: 'regular'),
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
