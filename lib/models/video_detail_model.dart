import 'package:filmax_app/models/related_video_model.dart';
import 'package:filmax_app/models/user_comments_model.dart';
import 'package:filmax_app/models/video_model.dart';

class VideoDetailModel {


  String? id;
  String? catId;
  String? videoType;
  String? videoTitle;
  String? videoUrl;
  String? videoId;
  String? videoThumbnailB;
  String? videoThumbnailS;
  String? videoDuration;
  String? videoDescription;
  String? rateAvg;
  String? totalViewer;
  String? cid;
  String? categoryName;
  List<RelatedVideoModel>? relatedVideos;
  List<UserCommentsModel>? userCommentsList;

  VideoDetailModel(
      this.id,
      this.catId,
      this.videoType,
      this.videoTitle,
      this.videoUrl,
      this.videoId,
      this.videoThumbnailB,
      this.videoThumbnailS,
      this.videoDuration,
      this.videoDescription,
      this.rateAvg,
      this.totalViewer,
      this.cid,
      this.categoryName,
      this.relatedVideos,
      this.userCommentsList);
}
