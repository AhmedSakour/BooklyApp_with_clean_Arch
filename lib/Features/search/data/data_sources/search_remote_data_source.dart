import 'package:bookly_clean_arch/core/entities/bookly_entity.dart';
import 'package:bookly_clean_arch/core/utils/api_service.dart';
import 'package:bookly_clean_arch/core/utils/functions/get_list_books.dart';

abstract class SearchRmoteDataSource {
  Future<List<BookEntity>> fetchSearchResult(
      {required String searchInput, int pageNumber = 0});
}

class SearchRemoteDataSourceImpl extends SearchRmoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchSearchResult(
      {required String searchInput, int pageNumber = 0}) async {
    var response = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&startIndex=${pageNumber * 10}&q=subject:$searchInput');
    List<BookEntity> books = getListBook(response);

    return books;
  }
}
