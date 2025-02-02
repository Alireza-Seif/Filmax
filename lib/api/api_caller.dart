import 'package:filmax_app/api/json_convertor.dart';
import 'package:filmax_app/constants/constants.dart';
import 'package:filmax_app/models/banners_model.dart';
import 'package:http/http.dart' as http;

class ApiCaller {
  Future<List<BannersModel>> getBannersList() async {
    var url = Uri.parse(Constants.bannersUrl);
    var response = await http.get(url);

    print(response.body);
    List<BannersModel> banners = JsonConvertor.getBanners(response);
    return banners;
  }
}
