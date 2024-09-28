import 'package:bookly_clean_arch/Features/home/Domain/repos/home_repo.dart';
import 'package:bookly_clean_arch/core/error/failure.dart';
import 'package:bookly_clean_arch/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/entities/bookly_entity.dart';

class FetchSimilerBookUseCase extends UseCase<List<BookEntity>, int, NoParams> {
  final HomeRepo homeRepo;

  FetchSimilerBookUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> call(
      [int pageNumber = 0, NoParams? noParams]) async {
    return await homeRepo.fetchSimilerBooks(pageNumber: pageNumber);
  }
}
