import 'package:flutter/material.dart';

import 'item_sura_details.dart';

class SuraContentListView extends StatelessWidget {
  const SuraContentListView({
    super.key,
    required this.ayat,
  });

  final List<String> ayat;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ItemSuraDetails(
          content: ayat,
          index: index,
        );
      },
      itemCount: ayat.length,
    );
  }
}