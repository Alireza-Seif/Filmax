import 'package:filmax_app/models/video_model.dart';

class HomeModel {
  List<VideoModel>? featuredVideoList;
  List<VideoModel>? latestVideo;
  List<VideoModel>? allVideo;

  HomeModel(this.featuredVideoList, this.latestVideo, this.allVideo);
}
