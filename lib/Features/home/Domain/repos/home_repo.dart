import 'package:bookly_clean_arch/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/entities/bookly_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewSetBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchSimilerBooks(
      {int pageNumber = 0});
}
