import 'package:bookly_clean_arch/Features/search/Domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly_clean_arch/core/error/failure.dart';
import 'package:bookly_clean_arch/core/entities/bookly_entity.dart';

class SearchRepoImpl extends SearchRepo {
  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchResult() {
    // TODO: implement fetchSearchResult
    throw UnimplementedError();
  }
}
