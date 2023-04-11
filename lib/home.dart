import 'package:flutter/material.dart';

import 'bloc.dart';
import 'data_repository.dart';
import 'data_source.dart';
import 'model.dart';

class QuranScreen extends StatefulWidget {
  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  final _bloc = QuranBloc(QuranRepository(QuranDataSource()));

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quran"),
      ),
      body: StreamBuilder<List<Surah>>(
        stream: _bloc.surahs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final surahs = snapshot.data!;

            return ListView.builder(
              itemCount: surahs.length,
              itemBuilder: (context, index) {
                final surah = surahs[index];

                return             ListTile(
              title: Text(surah.name),
              subtitle: Text(surah.englishName),
              trailing: Text(surah.numberOfAyahs.toString()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SurahScreen(surah: surah),
                  ),
                );
              },
            );
          },
        );
      } else if (snapshot.hasError) {
        return Center(
          child: Text("Error: ${snapshot.error}"),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  ),
);

}
}

class SurahScreen extends StatelessWidget {
final Surah surah;

const SurahScreen({Key? key, required this.surah}) : super(key: key);

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text(surah.name),
),
//commint
body: ListView.builder(
itemCount: surah.ayahs.length,
itemBuilder: (context, index) {
final ayah = surah.ayahs[index];
      return ListTile(
        title: Text(ayah.text),
        subtitle: Text(ayah.translation),
      );
    },
  ),
);
}
}