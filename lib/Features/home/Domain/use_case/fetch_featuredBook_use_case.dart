import 'package:bookly_clean_arch/Features/home/Domain/repos/home_repo.dart';
import 'package:bookly_clean_arch/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/entities/bookly_entity.dart';
import '../../../../core/error/failure.dart';

class FetchFeaturedBooksUseCase
    extends UseCase<List<BookEntity>, int, NoParams> {
  HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call(
      [int pageNumber = 0, NoParams? noParams]) async {
    return await homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
  }
}
