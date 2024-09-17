import 'package:bookly_clean_arch/Features/home/Domain/entities/bookly_entity.dart';
import 'package:bookly_clean_arch/Features/home/Domain/repos/home_repo.dart';
import 'package:bookly_clean_arch/Features/home/data/data%20_sources/home_local_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly_clean_arch/core/error/failure.dart';
import 'package:dio/dio.dart';

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
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewSetBooks() async {
    var localBooks = homeLocalDataSource.fetchNewSetBooks();
    if (localBooks.isNotEmpty) {
      return right(localBooks);
    }
    try {
      var remoteBooks = await homeRemoteDataSource.fetchNewSetBooks();
      return right(remoteBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
