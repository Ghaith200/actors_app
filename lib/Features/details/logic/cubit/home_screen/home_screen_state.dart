part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}
final class HomeScreenloaded extends HomeScreenState {
  final List<HomePageModel> wallpaper ;

  HomeScreenloaded(this.wallpaper);
}