import 'package:bookly_clean_arch/Features/search/Domain/repos/search_repo.dart';
import 'package:bookly_clean_arch/Features/search/data/data_sources/search_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly_clean_arch/core/error/failure.dart';
import 'package:bookly_clean_arch/core/entities/bookly_entity.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSourceImpl searchRemoteDataSourceImpl;

  SearchRepoImpl(this.searchRemoteDataSourceImpl);
  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchResult(
      {required String searchInput}) async {
    try {
      var remoteBooks = await searchRemoteDataSourceImpl.fetchSearchResult(
          searchInput: searchInput);
      return right(remoteBooks);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
