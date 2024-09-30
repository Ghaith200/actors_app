import 'package:gallery_app/data/Services/api_services.dart';
import 'package:gallery_app/data/Services/search_api.dart';
import 'package:gallery_app/data/models/home_page_model.dart';
import 'package:gallery_app/data/models/search_model.dart';

class SearchRepo {
  final SearchApi searchApi;
  final HomePageModel homePageModel;
  late String text ;

  SearchRepo(this.searchApi, this.homePageModel, this.text);
  Future<List<HomePageModel>> search() async {
    final image = await searchApi.searchPerson(text);
    return image.map((image) => HomePageModel.fromJson(image)).toList();
  }
}
