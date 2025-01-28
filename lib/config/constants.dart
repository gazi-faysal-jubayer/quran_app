import 'dart:ui';

class AppConstants {
  static const String quranApiUrl = 'https://api.alquran.cloud/v1';
  static const String fetchSurahsEndpoint = '$quranApiUrl/surah';
  static const String fetchAyahsEndpoint = '$quranApiUrl/surah'; // Updated to include language
  static const Color primaryColor = Color(0xFF2E7D32);
  static const Color secondaryColor = Color(0xFF388E3C);
}