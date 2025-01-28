import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/constants.dart';
import '../models/surah.dart';
import '../models/ayah.dart';

class QuranService {
  Future<List<Surah>> fetchSurahs() async {
    final response = await http.get(Uri.parse(AppConstants.fetchSurahsEndpoint));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final chapters = data['data'] as List; // Updated to match the API response
      return chapters.map<Surah>((json) => Surah.fromJson(json)).toList();
    }
    throw Exception('Failed to load Surahs');
  }

  Future<List<Ayah>> fetchAyahs(int surahId) async {
    // Fetch Arabic text
    final arabicResponse = await http.get(
      Uri.parse('${AppConstants.fetchAyahsEndpoint}/$surahId'),
    );

    // Fetch Bengali translation
    final bengaliResponse = await http.get(
      Uri.parse('${AppConstants.fetchAyahsEndpoint}/$surahId/bn.bengali'),
    );

    if (arabicResponse.statusCode == 200 && bengaliResponse.statusCode == 200) {
      final arabicData = json.decode(arabicResponse.body);
      final bengaliData = json.decode(bengaliResponse.body);

      if (arabicData['data'] != null && arabicData['data']['ayahs'] != null &&
          bengaliData['data'] != null && bengaliData['data']['ayahs'] != null) {
        final arabicAyahs = arabicData['data']['ayahs'] as List;
        final bengaliAyahs = bengaliData['data']['ayahs'] as List;

        // Combine Arabic text and Bengali translation
        final List<Ayah> ayahs = [];
        for (int i = 0; i < arabicAyahs.length; i++) {
          final arabicAyah = arabicAyahs[i];
          final bengaliAyah = bengaliAyahs[i];

          ayahs.add(Ayah(
            id: arabicAyah['number'] ?? 0,
            surahId: arabicAyah['surah'] != null ? arabicAyah['surah']['number'] ?? 0 : 0,
            textArabic: arabicAyah['text'] ?? 'No Arabic text available',
            translation: bengaliAyah['text'] ?? 'No Arabic text available',
          ));
        }

        return ayahs;
      } else {
        throw Exception('No verses found in the response');
      }
    }
    throw Exception('Failed to load Ayahs');
  }
}