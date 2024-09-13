import 'package:bloc/bloc.dart';
import 'package:gallery_app/data/models/home_page_model.dart';
import 'package:gallery_app/data/repository/wallpapers_repo.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {

  final WallpapersRepo wallpapersRepo ;
  late  List<Wallpaper> wallpaper ;
  HomeScreenCubit(this.wallpapersRepo) : super(HomeScreenInitial());




  List<Wallpaper> getWallpapers() {
    wallpapersRepo.getWallpapers().then((Wallpaper){
      emit(HomeScreenloaded(Wallpaper));
        this.wallpaper = Wallpaper;
    });
    return wallpaper;
  }
}
