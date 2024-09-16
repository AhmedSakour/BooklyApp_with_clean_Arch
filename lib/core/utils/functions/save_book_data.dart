import 'package:hive_flutter/adapters.dart';

import '../../../Features/home/Domain/entities/bookly_entity.dart';

void saveBookData(List<BookEntity> books, String boxName) {
  var book = Hive.box<BookEntity>(boxName);
  book.addAll(books);
}
