import 'package:bookly_clean_arch/Features/home/Domain/entities/bookly_entity.dart';
import 'package:bookly_clean_arch/Features/home/Domain/repos/home_repo.dart';
import 'package:bookly_clean_arch/core/error/failure.dart';
import 'package:bookly_clean_arch/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class SimilerBookUseCase extends UseCase<List<BookEntity>, NoParams> {
  final HomeRepo homeRepo;

  SimilerBookUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParams? param]) async {
    return await homeRepo.fetchSimilerBooks();
  }
}
