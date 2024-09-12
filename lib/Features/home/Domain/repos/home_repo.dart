import 'package:bookly_clean_arch/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/bookly_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookEntity>>> fetchNewSetBooks();
}
