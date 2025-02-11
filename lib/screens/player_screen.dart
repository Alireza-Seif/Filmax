import 'package:chewie/chewie.dart';
import 'package:filmax_app/api/api_caller.dart';
import 'package:filmax_app/constants/app_colors.dart';
import 'package:filmax_app/constants/app_setting.dart';
import 'package:filmax_app/models/status_model.dart';
import 'package:filmax_app/models/video_detail_model.dart';
import 'package:filmax_app/models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:video_player/video_player.dart';

class PlayerScreen extends StatefulWidget {
  final VideoModel video;

  const PlayerScreen({super.key, required this.video});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  ApiCaller apiCaller = ApiCaller();
  late Future<VideoDetailModel> videoDetail;

  String commentText = '';
  AppSetting appSetting = AppSetting();

  String userName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse('${widget.video.videoUrl}'));
    // loadVideoPlayer();
    getUserId();
  }

  getUserId() async {
    userName = await appSetting.getUserName();
  }

  Future<bool> loadVideoPlayer() async {
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    videoDetail = apiCaller.getSingleVideo(widget.video.id!);

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text('${widget.video.videoTitle}'),
        centerTitle: true,
        backgroundColor: AppColors.orange,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<VideoDetailModel>(
        future: videoDetail,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    FutureBuilder<bool>(
                      future: loadVideoPlayer(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return SizedBox(
                            height: 200,
                            child: Chewie(controller: chewieController),
                          );
                        } else if (snapshot.hasError) {
                          return Text(
                            'Error: $snapshot',
                            style: TextStyle(color: Colors.white),
                          );
                        } else {
                          return CircularProgressIndicator(
                            backgroundColor: AppColors.orange,
                            color: AppColors.darkOrange,
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Html(
                        data: widget.video.videoDescription,
                        style: {
                          'p': Style(
                              color: Colors.white, direction: TextDirection.rtl)
                        },
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.userCommentsList!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50.0,
                          child: Row(
                            children: [
                              Text(
                                '${snapshot.data!.userCommentsList![index].userName}',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '${snapshot.data!.userCommentsList![index].commentText}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        cursorColor: AppColors.darkOrange,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.darkOrange),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.orange),
                            ),
                            hintText: 'Write your Comment'),
                        onChanged: (value) {
                          commentText = value;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkOrange,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          StatusModel statusModel = await apiCaller.addComment(
                              commentText, userName, widget.video.id!);

                          if (statusModel.success == '1') {
                            SnackBar snackBar =
                                SnackBar(content: Text('Successful'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            SnackBar snackBar =
                                SnackBar(content: Text('Error '));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Text('Send'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(
              'Error in Server',
              style: TextStyle(color: Colors.white),
            );
          } else {
            return CircularProgressIndicator(
              backgroundColor: AppColors.orange,
              color: AppColors.darkOrange,
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
