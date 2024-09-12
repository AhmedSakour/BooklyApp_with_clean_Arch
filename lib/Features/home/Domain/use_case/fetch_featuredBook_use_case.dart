import 'package:bookly_clean_arch/Features/home/Domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/bookly_entity.dart';

class FetchFeaturedBooksUseCase {
  HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    return homeRepo.fetchFeaturedBooks();
  }
}
