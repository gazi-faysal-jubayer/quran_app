class Surah {
  final int id;
  final String name;
  final String englishName;
  final int ayahs;

  Surah({
    required this.id,
    required this.name,
    required this.englishName,
    required this.ayahs,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      id: json['number'] ?? 0,
      name: json['name'] ?? 'Unknown',
      englishName: json['englishName'] ?? 'Unknown',
      ayahs: json['numberOfAyahs'] ?? 0,
    );
  }
}