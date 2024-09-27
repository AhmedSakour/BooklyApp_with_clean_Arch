import 'package:bloc/bloc.dart';

class SearchInputCubit extends Cubit<String> {
  SearchInputCubit() : super('');
  String searchInput = '';
  setSearchInput(String value) {
    emit(searchInput = value);
  }
}
