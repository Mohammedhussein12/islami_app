import 'package:flutter/material.dart';
import 'hadeth.dart';

class HadethContentItem extends StatelessWidget {
  const HadethContentItem({
    super.key,
    required this.height,
    required this.width,
    required this.hadeth,
    required this.index,
  });

  final double height;
  final double width;
  final Hadeth hadeth;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.02, horizontal: width * 0.02),
      child: Text(
        hadeth.content[index],
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
