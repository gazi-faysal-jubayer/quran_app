import 'package:flutter/material.dart';
import '../models/surah.dart';
import '../screens/surah_screen.dart';

class SurahListTile extends StatelessWidget {
  final Surah surah;

  SurahListTile({required this.surah});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(surah.name),
      subtitle: Text(surah.englishName),
      trailing: Text('${surah.ayahs} Ayahs'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SurahScreen(surahId: surah.id, surahName: surah.englishName),
          ),
        );
      },
    );
  }
}