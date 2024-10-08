import 'package:bookly_clean_arch/core/entities/bookly_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:bookly_clean_arch/core/error/failure.dart';

import '../../../../core/use_cases/use_case.dart';
import '../repos/search_repo.dart';

class FethcSearchResultUseCase extends UseCase<List<BookEntity>, String, int> {
  final SearchRepo searchRepo;

  FethcSearchResultUseCase({required this.searchRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call(
      [String param = '', int pageNumber = 0]) async {
    return await searchRepo.fetchSearchResult(
        searchInput: param, pageNumber: pageNumber);
  }
}
