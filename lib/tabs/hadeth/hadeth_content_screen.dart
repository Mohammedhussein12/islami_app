import 'package:flutter/material.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/app_theme.dart';
import 'hadeth.dart';
import 'hadeth_content_item.dart';

class HadethContentScreen extends StatefulWidget {
  static const String routeName = '/hadethContentScreen';

  const HadethContentScreen({super.key});

  @override
  State<HadethContentScreen> createState() => _HadethContentScreenState();
}

class _HadethContentScreenState extends State<HadethContentScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    final width = MediaQuery.of(context).size.width;
    var hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
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
                ? AppTheme.darkPrimary.withOpacity(0.7)
                : AppTheme.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    hadeth.title,
                    style: settingsProvider.isDark
                        ? Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontFamily: 'regular')
                            .copyWith(fontSize: 18, color: AppTheme.gold)
                        : Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontFamily: 'regular')
                            .copyWith(fontSize: 18, color: AppTheme.black),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: hadeth.content.length,
                  itemBuilder: (context, index) {
                    return HadethContentItem(
                      height: height,
                      width: width,
                      hadeth: hadeth,
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
