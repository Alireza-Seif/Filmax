import 'package:filmax_app/api/json_convertor.dart';
import 'package:filmax_app/constants/constants.dart';
import 'package:filmax_app/models/banners_model.dart';
import 'package:filmax_app/models/category_model.dart';
import 'package:filmax_app/models/home_model.dart';
import 'package:filmax_app/models/status_model.dart';
import 'package:filmax_app/models/video_detail_model.dart';
import 'package:filmax_app/models/video_model.dart';
import 'package:http/http.dart' as http;

class ApiCaller {
  Future<List<BannersModel>> getBannersList() async {
    var url = Uri.parse(Constants.bannersUrl);
    var response = await http.get(url);

    List<BannersModel> banners = JsonConvertor.getBanners(response);

    return banners;
  }

  Future<HomeModel> getHomeVideos() async {
    var url = Uri.parse(Constants.videoUrl);
    var response = await http.get(url);
    HomeModel homeModel = JsonConvertor.getHomeVideos(response);

    return homeModel;
  }

  Future<List<CategoryModel>> getCategories() async {
    var url = Uri.parse(Constants.categoryUrl);
    var response = await http.get(url);

    List<CategoryModel> categoriesList = JsonConvertor.getCategories(response);

    return categoriesList;
  }

  Future<List<VideoModel>> getVideos(String categoryId) async {
    var url = Uri.parse(Constants.videoCategoryUrl + categoryId);
    var response = await http.get(url);

    List<VideoModel> videoList = JsonConvertor.getVideos(response);

    return videoList;
  }

  Future<StatusModel> register(
      String name, String email, String phone, String password) async {
    var url = Uri.parse(
        '${Constants.registerUrl}&name=$name&email=$email&password=$password&phone=$phone');
    var response = await http.get(url);

    return JsonConvertor.getRegister(response);
  }

  Future login(String email, String password) async {
    var url =
        Uri.parse('${Constants.loginUrl}&email=$email&password=$password');
    var response = await http.get(url);
    return JsonConvertor.getLogin(response);
  }

  Future<VideoDetailModel> getSingleVideo(String videoId) async {
    var url = Uri.parse(Constants.singleVideoUrl + videoId);
    var response = await http.get(url);

    VideoDetailModel video = JsonConvertor.getSingleVideos(response);
    return video;
  }
}
