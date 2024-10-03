import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: height * 0.16),
          Image.asset(
            'assets/images/radio_image.png',
            height: height * 0.25,
          ),
          SizedBox(height: height * 0.06),
          Text('إذاعة القرآن الكريم',
              style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: height * 0.06),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  color: Theme.of(context).primaryColor,
                  const AssetImage('assets/images/Icon metro-previous.png'),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  color: Theme.of(context).primaryColor,
                  const AssetImage('assets/images/Icon awesome-play.png'),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  color: Theme.of(context).primaryColor,
                  const AssetImage('assets/images/Icon metro-next.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
