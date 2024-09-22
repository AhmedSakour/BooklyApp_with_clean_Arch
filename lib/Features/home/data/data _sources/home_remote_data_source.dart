import 'package:bookly_clean_arch/constants.dart';
import 'package:bookly_clean_arch/core/utils/api_service.dart';

import '../../../../core/utils/functions/save_book_data.dart';
import '../../Domain/entities/bookly_entity.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewSetBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchSimilerBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getListBook(data);
    saveBookData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewSetBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newset&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getListBook(data);
    saveBookData(books, kNewSetBox);
    return books;
  }

  List<BookEntity> getListBook(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilerBooks() async {
    var data = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming');
    List<BookEntity> books = getListBook(data);
    saveBookData(books, kSimilerBox);
    return books;
  }
}
