import 'package:flutter/material.dart';

class QuranItem extends StatelessWidget {
  String item;

  QuranItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        textAlign: TextAlign.center,
        item,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontFamily: 'regular'),
      ),
    );
  }
}