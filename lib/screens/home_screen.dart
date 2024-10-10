import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/radio/radio_tab.dart';
import 'package:islami/tabs/sebha/sebha_tab.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:islami/tabs/settings/settings_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const QuranTab(),
    const HadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
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
          title: Text(
              'إسلامي',
              style: settingsProvider.isDark
                  ? Theme
                  .of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)
                  : Theme
                  .of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
          ),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            print(currentIndex);
            setState(() {});
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icon_quran.png'),
              ),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icon_hadeth.png'),
              ),
              label: 'Hadeth',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icon_sebha.png'),
              ),
              label: 'Sebha',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icon_radio.png'),
              ),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
