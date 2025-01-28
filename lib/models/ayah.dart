class Ayah {
  final int id;
  final int surahId;
  final String textArabic; // Arabic text of the ayah
  final String translation; // Bengali translation

  Ayah({
    required this.id,
    required this.surahId,
    required this.textArabic,
    required this.translation,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      id: json['number'] ?? 0,
      surahId: json['surah'] != null ? json['surah']['number'] ?? 0 : 0,
      textArabic: json['text'] ?? 'No Arabic text available', // Arabic text
      translation: json['translation'] ?? 'No translation available', // Bengali translation
    );
  }
}