import 'package:flutter/material.dart';
import '../models/ayah.dart';
import '../models/surah.dart';
import '../services/quran_service.dart';

class QuranProvider with ChangeNotifier {
  List<Surah> _surahs = [];
  List<Surah> get surahs => _surahs;

  Future<void> loadSurahs() async {
    _surahs = await QuranService().fetchSurahs();
    notifyListeners();
  }

  Future<List<Ayah>> loadAyahs(int surahId) async {
    return await QuranService().fetchAyahs(surahId);
  }
}