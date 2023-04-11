import 'data_repository.dart';
import 'model.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class QuranBloc {
  final QuranRepository _repository;

  final _surahs = BehaviorSubject<List<Surah>>();
  Stream<List<Surah>> get surahs => _surahs.stream;

  QuranBloc(this._repository) {
    _fetchSurahs();
  }

  Future<void> _fetchSurahs() async {
    final surahs = await _repository.getSurahs();
    _surahs.sink.add(surahs);
  }

  void dispose() {
    _surahs.close();
  }
}
