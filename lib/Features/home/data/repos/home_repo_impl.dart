import 'package:bookly_clean_arch/Features/home/Domain/entities/bookly_entity.dart';
import 'package:bookly_clean_arch/Features/home/Domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly_clean_arch/core/error/failure.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewSetBooks() {
    // TODO: implement fetchNewSetBooks
    throw UnimplementedError();
  }
}
