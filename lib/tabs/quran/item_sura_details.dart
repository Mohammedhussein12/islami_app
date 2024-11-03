import 'package:flutter/material.dart';

class ItemSuraDetails extends StatelessWidget {
  const ItemSuraDetails({
    super.key,
    required this.content,
    required this.index,
  });

  final List<String> content;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        content[index],
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}