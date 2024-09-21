import 'package:bookly_clean_arch/Features/home/Domain/repos/home_repo.dart';
import 'package:bookly_clean_arch/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/bookly_entity.dart';

class FetchNewsetBooksUseCase extends UseCase<List<BookEntity>, int> {
  HomeRepo homeRepo;

  FetchNewsetBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber = 0]) async {
    return await homeRepo.fetchNewSetBooks(pageNumber: pageNumber);
  }
}
