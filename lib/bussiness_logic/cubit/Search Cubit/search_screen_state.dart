part of 'search_screen_cubit.dart';

@immutable
sealed class SearchScreenState {}

final class SearchScreenInitial extends SearchScreenState {}
final class SearchScreenloaded extends SearchScreenState {  
  final List<Wallpaper> wallpaper ;
  SearchScreenloaded( this.wallpaper);
}
