import 'package:flutter/material.dart';
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
    final width = MediaQuery.of(context).size.width;
    var hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
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
          padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.01),
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
                    hadeth.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontFamily: 'regular')
                        .copyWith(fontSize: 18),
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
