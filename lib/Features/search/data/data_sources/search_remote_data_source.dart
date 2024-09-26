import 'package:bookly_clean_arch/core/entities/bookly_entity.dart';
import 'package:bookly_clean_arch/core/utils/api_service.dart';
import 'package:bookly_clean_arch/core/utils/functions/get_list_books.dart';
import 'package:bookly_clean_arch/core/utils/functions/save_book_data.dart';

import '../../../../constants.dart';

abstract class SearchRmoteDataSource {
  Future<List<BookEntity>> fetchSearchResult({required String searchInput});
}

class SearchRemoteDataSourceImpl extends SearchRmoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchSearchResult(
      {required String searchInput}) async {
    var response = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=subject:$searchInput');
    List<BookEntity> books = getListBook(response);
    saveBookData(books, kSearchBox);
    return books;
  }
}
