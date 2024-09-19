import 'package:bookly_clean_arch/Features/home/Domain/use_case/fetch_featuredBook_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Domain/entities/bookly_entity.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.featuredBooksUseCase) : super(FeaturedBookInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBookLoading());
    var result = await featuredBooksUseCase.call();
    result.fold((l) => emit(FeaturedBookFailure(l.toString())),
        (r) => emit(FeaturedBookSuccess(r)));
  }
}
