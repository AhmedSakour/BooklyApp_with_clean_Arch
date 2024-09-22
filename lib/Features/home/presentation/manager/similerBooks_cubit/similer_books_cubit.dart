import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'similer_books_state.dart';

class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit() : super(SimilerBooksInitial());
}
