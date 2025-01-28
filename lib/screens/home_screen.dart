import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quran_provider.dart';
import '../widgets/surah_list_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quranProvider = Provider.of<QuranProvider>(context, listen: false);

    // Fetch Surahs when the screen loads
    Future.delayed(Duration.zero, () {
      quranProvider.loadSurahs();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Quran App'),
      ),
      body: Consumer<QuranProvider>(
        builder: (context, quranProvider, child) {
          if (quranProvider.surahs.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: quranProvider.surahs.length,
            itemBuilder: (context, index) {
              return SurahListTile(surah: quranProvider.surahs[index]);
            },
          );
        },
      ),
    );
  }
}