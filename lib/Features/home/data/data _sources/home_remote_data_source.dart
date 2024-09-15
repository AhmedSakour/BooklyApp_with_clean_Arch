import '../../Domain/entities/bookly_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewSetBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetchNewSetBooks() {
    // TODO: implement fetchNewSetBooks
    throw UnimplementedError();
  }
}
