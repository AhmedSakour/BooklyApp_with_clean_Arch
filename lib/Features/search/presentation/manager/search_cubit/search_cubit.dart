import 'package:bloc/bloc.dart';
import 'package:bookly_clean_arch/core/entities/bookly_entity.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
}
