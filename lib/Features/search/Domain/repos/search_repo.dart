import 'package:bookly_clean_arch/core/entities/bookly_entity.dart';
import 'package:bookly_clean_arch/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> fetchSearchResult(
      {required String searchInput});
}
