import 'package:bookly_clean_arch/constants.dart';
import 'package:hive_flutter/adapters.dart';

import '../../Domain/entities/bookly_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewSetBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewSetBooks() {
    var box = Hive.box<BookEntity>(kNewSetBox);
    return box.values.toList();
  }
}
