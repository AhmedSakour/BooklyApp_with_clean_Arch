import 'package:bookly_clean_arch/Features/home/Domain/repos/home_repo.dart';
import 'package:bookly_clean_arch/Features/home/data/data%20_sources/home_local_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly_clean_arch/core/error/failure.dart';
import 'package:dio/dio.dart';

import '../../../../core/entities/bookly_entity.dart';
import '../data _sources/home_remote_data_source.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    var localBooks =
        homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
    if (localBooks.isNotEmpty) {
      return right(localBooks);
    }
    try {
      var remoteBooks =
          await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      return right(remoteBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewSetBooks(
      {int pageNumber = 0}) async {
    var localBooks =
        homeLocalDataSource.fetchNewSetBooks(pageNumber: pageNumber);
    if (localBooks.isNotEmpty) {
      return right(localBooks);
    }
    try {
      var remoteBooks =
          await homeRemoteDataSource.fetchNewSetBooks(pageNumber: pageNumber);
      return right(remoteBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilerBooks(
      {int pageNumber = 0}) async {
    var localBooks =
        homeLocalDataSource.fetchSimilerBook(pageNumber: pageNumber);
    if (localBooks.isNotEmpty) {
      return right(localBooks);
    }

    try {
      var remoteBooks =
          await homeRemoteDataSource.fetchSimilerBooks(pageNumber: pageNumber);
      return right(remoteBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
