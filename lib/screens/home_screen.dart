import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffB7935F),
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.brown,
        type: BottomNavigationBarType.fixed,
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
    );
  }
}
