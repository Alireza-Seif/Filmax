import 'dart:convert';

import 'package:filmax_app/models/banners_model.dart';
import 'package:filmax_app/models/home_model.dart';
import 'package:filmax_app/models/video_model.dart';
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

  static HomeModel getHomeVideos(Response response) {
    Map map = jsonDecode(response.body);
    Map data = map['ALL_IN_ONE_VIDEO'];
    List featuredVideo = data['featured_video'];
    List<VideoModel> featuredVideoList = [];

    featuredVideo.forEach((element) {
      Map map = element;
      String? id = map['id'];
      String? catId = map['cat_id'];
      String? videoType = map['video_type'];
      String? videoTitle = map['video_title'];
      String? videoUrl = map['video_url'];
      String? videoId = map['video_id'];
      String? videoThumbnailB = map['video_thumbnail_b'];
      String? videoThumbnailS = map['video_thumbnail_s'];
      String? videoDuration = map['video_duration'];
      String? videoDescription = map['video_description'];
      String? rateAvg = map['rate_avg'];
      String? totalViewer = map['totel_viewer'];
      String? cid = map['cid'];
      String? categoryName = map['category_name'];
      String? categoryImage = map['category_image'];
      String? categoryImageThumb = map['category_image_thumb'];

      featuredVideoList.add(VideoModel(
          id,
          catId,
          videoType,
          videoTitle,
          videoUrl,
          videoId,
          videoThumbnailB,
          videoThumbnailS,
          videoDuration,
          videoDescription,
          rateAvg,
          totalViewer,
          cid,
          categoryName,
          categoryImage,
          categoryImageThumb));
    });

    List latestVideo = data['latest_video'];
    List<VideoModel> latestVideoList = [];

    latestVideo.forEach((element) {
      Map map = element;

      String? id = map['id'];
      String? catId = map['cat_id'];
      String? videoType = map['video_type'];
      String? videoTitle = map['video_title'];
      String? videoUrl = map['video_url'];
      String? videoId = map['video_id'];
      String? videoThumbnailB = map['video_thumbnail_b'];
      String? videoThumbnailS = map['video_thumbnail_s'];
      String? videoDuration = map['video_duration'];
      String? videoDescription = map['video_description'];
      String? rateAvg = map['rate_avg'];
      String? totalViewer = map['totel_viewer'];
      String? cid = map['cid'];
      String? categoryName = map['category_name'];
      String? categoryImage = map['category_image'];
      String? categoryImageThumb = map['category_image_thumb'];

      latestVideoList.add(VideoModel(
          id,
          catId,
          videoType,
          videoTitle,
          videoUrl,
          videoId,
          videoThumbnailB,
          videoThumbnailS,
          videoDuration,
          videoDescription,
          rateAvg,
          totalViewer,
          cid,
          categoryName,
          categoryImage,
          categoryImageThumb));
    });

    List allVideo = data['all_video'];
    List<VideoModel> allVideoList = [];

    allVideo.forEach((element) {
      Map map = element;

      String? id = map['id'];
      String? catId = map['cat_id'];
      String? videoType = map['video_type'];
      String? videoTitle = map['video_title'];
      String? videoUrl = map['video_url'];
      String? videoId = map['video_id'];
      String? videoThumbnailB = map['video_thumbnail_b'];
      String? videoThumbnailS = map['video_thumbnail_s'];
      String? videoDuration = map['video_duration'];
      String? videoDescription = map['video_description'];
      String? rateAvg = map['rate_avg'];
      String? totalViewer = map['totel_viewer'];
      String? cid = map['cid'];
      String? categoryName = map['category_name'];
      String? categoryImage = map['category_image'];
      String? categoryImageThumb = map['category_image_thumb'];

      allVideoList.add(VideoModel(
          id,
          catId,
          videoType,
          videoTitle,
          videoUrl,
          videoId,
          videoThumbnailB,
          videoThumbnailS,
          videoDuration,
          videoDescription,
          rateAvg,
          totalViewer,
          cid,
          categoryName,
          categoryImage,
          categoryImageThumb));
    });

    HomeModel homeModel =
        HomeModel(featuredVideoList, latestVideoList, allVideoList);

    return homeModel;
  }
}
