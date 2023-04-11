import 'data_source.dart';
import 'model.dart';

class QuranRepository {
  final QuranDataSource _dataSource;

  QuranRepository(this._dataSource);

  Future<List<Surah>> getSurahs() async {
    final surahs = await _dataSource.getSurahs();

    return surahs;
  }
}
