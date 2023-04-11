class Surah {
  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  int numberOfAyahs;
  List<Ayah> ayahs;

  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.ayahs,
  });
}

class Ayah {
  int number;
  String text;
  String translation;

  Ayah({
    required this.number,
    required this.text,
    required this.translation,
  });
}
