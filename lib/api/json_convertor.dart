import 'dart:convert';

import 'package:filmax_app/models/banners_model.dart';
import 'package:filmax_app/models/category_model.dart';
import 'package:filmax_app/models/home_model.dart';
import 'package:filmax_app/models/login_status_model.dart';
import 'package:filmax_app/models/status_model.dart';
import 'package:filmax_app/models/video_detail_model.dart';
import 'package:filmax_app/models/video_model.dart';
import 'package:http/http.dart';

import '../constants/app_setting.dart';
import '../models/related_video_model.dart';
import '../models/user_comments_model.dart';

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

  static List<CategoryModel> getCategories(Response response) {
    Map map = jsonDecode(response.body);
    List data = map['ALL_IN_ONE_VIDEO'];
    List<CategoryModel> categoryList = [];

    data.forEach((element) {
      Map map = element;

      String? cId = map['cid'];
      String? categoryName = map['category_name'];
      String? categoryImage = map['category_image'];
      String? categoryImageThumb = map['category_image_thumb'];

      categoryList.add(
          CategoryModel(cId, categoryName, categoryImage, categoryImageThumb));
    });

    return categoryList;
  }

  static List<VideoModel> getVideos(Response response) {
    Map map = jsonDecode(response.body);
    List data = map['ALL_IN_ONE_VIDEO'];
    List<VideoModel> videos = [];

    data.forEach((element) {
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

      videos.add(VideoModel(
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
        categoryImageThumb,
      ));
    });

    return videos;
  }

  static VideoDetailModel getSingleVideos(Response response) {
    Map mapData = jsonDecode(response.body);
    List data = mapData['ALL_IN_ONE_VIDEO'];

    Map map = data[0];
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
    String? cid = map['cat_id'];
    String? categoryName = map['category_name'];
    List related = map['related'];
    List<RelatedVideoModel> relatedVideos = [];

    related.forEach(
      (element) {
        Map mapRelated = element;
        String? id = mapRelated['id'];
        String? catId = mapRelated['cat_id'];
        String? videoType = mapRelated['video_type'];
        String? videoTitle = mapRelated['video_title'];
        String? videoUrl = mapRelated['video_url'];
        String? videoId = mapRelated['video_id'];
        String? videoThumbnailB = mapRelated['video_thumbnail_b'];
        String? videoThumbnailS = mapRelated['video_thumbnail_s'];
        String? videoDuration = mapRelated['video_duration'];
        String? videoDescription = mapRelated['video_description'];
        String? rateAvg = mapRelated['rate_avg'];
        String? totalViewer = mapRelated['totel_viewer'];
        String? cid = mapRelated['cat_id'];
        String? categoryName = mapRelated['category_name'];

        relatedVideos.add(RelatedVideoModel(
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
        ));
      },
    );

    List userComments = map['user_comments'];
    List<UserCommentsModel>? userCommentsList = [];

    userComments.forEach(
      (element) {
        Map mapUser = element;
        String? videoId = mapUser['video_id'];
        String? userName = mapUser['user_name'];
        String? commentText = mapUser['comment_text'];
        userCommentsList.add(UserCommentsModel(videoId, userName, commentText));
      },
    );

    VideoDetailModel videoDetailModel = VideoDetailModel(
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
        relatedVideos,
        userCommentsList);

    return videoDetailModel;
  }

  static getRegister(Response response) {
    Map map = jsonDecode(response.body);

    List data = map['ALL_IN_ONE_VIDEO'];

    Map mapData = data[0];
    var msg = mapData['msg'];
    String success = mapData['success'];

    return StatusModel(msg, success);
  }

  static getLogin(Response response) {
    Map map = jsonDecode(response.body);

    List data = map['ALL_IN_ONE_VIDEO'];

    Map mapData = data[0];
    String userId = mapData['user_id'];
    String name = mapData['name'];
    String email = mapData['email'];
    String success = mapData['success'];
    if (success == '1') {
      AppSetting appSetting = AppSetting();

      appSetting.setUserLogged(true);
      // appSetting.setUserId(userId);
      appSetting.saveUserProfile(userId, name, email);

      print('${appSetting.getUserId()}');

      return LoginStatus(userId, name, email, success);
    } else {
      var msg = mapData['msg'];
      return StatusModel(msg, success);
    }
  }


  static StatusModel sendComment(Response response){
    Map map = jsonDecode(response.body);
    List data = map['ALL_IN_ONE_VIDEO'];
    Map mapData = data[0];
    var msg = mapData['msg'];
    String success = mapData['success'];

    return StatusModel(msg, success);

  }
}
