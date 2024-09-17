import 'package:bookly_clean_arch/Features/home/Domain/entities/bookly_entity.dart';
import 'package:bookly_clean_arch/Features/home/Domain/repos/home_repo.dart';
import 'package:bookly_clean_arch/Features/home/data/data%20_sources/home_local_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly_clean_arch/core/error/failure.dart';

import '../data _sources/home_remote_data_source.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    var localBooks = homeLocalDataSource.fetchFeaturedBooks();
    if (localBooks.isNotEmpty) {
      return right(localBooks);
    }
    try {
      var remoteBooks = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(remoteBooks);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewSetBooks() {
    // TODO: implement fetchNewSetBooks
    throw UnimplementedError();
  }
}
