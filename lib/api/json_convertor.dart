import 'dart:convert';

import 'package:filmax_app/models/banners_model.dart';
import 'package:http/http.dart';

class JsonConvertor {
  static List<BannersModel> getBanners(Response response) {
    Map map = jsonDecode(response.body);
    List data = map['ALL_IN_ONE_VIDEO'];
    List<BannersModel> bannersList = [];

    data.forEach((element) {
      Map map = element;

      String id = map['id'];
      String bannerName = map['banner_name'];
      String bannerImage = map['banner_image'];
      String bannerImageThumb = map['banner_image_thumb'];
      String bannerUrl = map['banner_url'];

      BannersModel bannersModel = BannersModel(
          id, bannerName, bannerImage, bannerImageThumb, bannerUrl);
      bannersList.add(bannersModel);
    });

    return bannersList;
  }
}
