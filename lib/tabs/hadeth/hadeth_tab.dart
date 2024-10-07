import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/widgets/loading_indicator.dart';
import 'hadeth.dart';
import 'hadeth_content_screen.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    if (ahadeth.isEmpty) {
      loadHadethFile();
    }
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            "assets/images/hadeth_logo.png",
            height: height * 0.25,
            fit: BoxFit.fill,
          ),
          const Divider(),
          Center(
            child: Text(
              'الأحاديث',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 22),
            ),
          ),
          const Divider(),
          Expanded(
            child: ahadeth.isEmpty
                ? const LoadingIndicator()
                : ListView.builder(
                    itemCount: ahadeth.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, HadethContentScreen.routeName,
                                  arguments: ahadeth[index]);
                            },
                            child: Text(
                              textAlign: TextAlign.center,
                              ahadeth[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 25),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Future<void> loadHadethFile() async {
    String AhadethText = await rootBundle.loadString('assets/text/ahadeth.txt');
    List<String> ahadethStrings = AhadethText.split('#');
    ahadeth = ahadethStrings.map(
      (hadeth) {
        List<String> hadethLines = hadeth.trim().split('\n');
        String title = hadethLines[0];
        hadethLines.removeAt(0);
        List<String> content = hadethLines;
        return Hadeth(title: title, content: content);
      },
    ).toList();
    setState(() {});
  }
}
