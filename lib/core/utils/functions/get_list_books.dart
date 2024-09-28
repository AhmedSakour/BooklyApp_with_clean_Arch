import '../../book_model/book_model.dart';
import '../../entities/bookly_entity.dart';

List<BookEntity> getListBook(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  if (data['items'] != null) {
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
  }
  return books;
}
