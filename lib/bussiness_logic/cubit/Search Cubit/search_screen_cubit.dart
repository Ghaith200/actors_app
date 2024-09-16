// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:gallery_app/data/models/home_page_model.dart';
import 'package:gallery_app/data/repository/wallpapers_repo.dart';
import 'package:meta/meta.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  final WallpapersRepo wallpapersRepo;
  List<Wallpaper> wallpaper = [];
  List<Wallpaper> getWallpapers() {
    wallpapersRepo.getWallpapers().then((wallpaper) {
      this.wallpaper = wallpaper;
      emit(SearchScreenloaded(wallpaper));
    });
    return wallpaper;
  }

  SearchScreenCubit(this.wallpapersRepo) : super(SearchScreenInitial());
}
