import 'package:bookly_clean_arch/constants.dart';
import 'package:hive_flutter/adapters.dart';

import '../../Domain/entities/bookly_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewSetBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box = Hive.box<BookEntity>(kFeaturedBox);
    int lenght = box.values.length;
    if (startIndex >= lenght || endIndex > lenght) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewSetBooks() {
    var box = Hive.box<BookEntity>(kNewSetBox);
    return box.values.toList();
  }
}
