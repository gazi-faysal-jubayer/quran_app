import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quran_provider.dart';
import '../models/ayah.dart';
import '../widgets/ayah_card.dart';

class SurahScreen extends StatelessWidget {
  final int surahId;
  final String surahName;

  SurahScreen({super.key, required this.surahId, required this.surahName});

  @override
  Widget build(BuildContext context) {
    final quranProvider = Provider.of<QuranProvider>(context, listen: false);

    // Fetch Ayahs when the screen loads
    Future.delayed(Duration.zero, () {
      quranProvider.loadAyahs(surahId);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('$surahName'),
      ),
      body: FutureBuilder<List<Ayah>>(
        future: quranProvider.loadAyahs(surahId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Ayahs found'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return AyahCard(ayah: snapshot.data![index]);
            },
          );
        },
      ),
    );
  }
}