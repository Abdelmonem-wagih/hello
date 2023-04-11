import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

class QuranDataSource {
  static const String baseUrl = "http://api.quran.com/api/v3/chapters/";

  Future<List<Surah>> getSurahs() async {
    final response = await http.get(Uri.parse(baseUrl));
    final surahList = jsonDecode(response.body)["chapters"] as List;

    return surahList.map((surah) {
      final ayahs = List.generate(surah["verses_count"], (i) {
        return Ayah(
          number: i + 1,
          text: "",
          translation: "",
        );
      });

      return Surah(
        number: surah["id"],
        name: surah["name_arabic"],
        englishName: surah["name_complex"],
        englishNameTranslation: surah["translated_name"]["name"],
        numberOfAyahs: surah["verses_count"],
        ayahs: ayahs,
      );
    }).toList();
  }
}
