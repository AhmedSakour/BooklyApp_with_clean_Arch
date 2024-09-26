import 'package:hive_flutter/adapters.dart';

import '../../../../constants.dart';
import '../../../../core/entities/bookly_entity.dart';

abstract class SearchLocalDataSource {
  List<BookEntity> fetchSearchResult();
}

class SearchLocalDataSourceImpl extends SearchLocalDataSource {
  @override
  List<BookEntity> fetchSearchResult() {
    var box = Hive.box<BookEntity>(kSearchBox);
    return box.values.toList();
  }
}
