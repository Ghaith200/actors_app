import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  SearchScreenCubit() : super(SearchScreenInitial());
}
