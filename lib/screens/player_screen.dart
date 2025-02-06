import 'package:chewie/chewie.dart';
import 'package:filmax_app/constants/app_colors.dart';
import 'package:filmax_app/models/video_model.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse('${widget.video.videoUrl}'));
    // loadVideoPlayer();
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
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text('${widget.video.videoTitle}'),
        centerTitle: true,
        backgroundColor: AppColors.orange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder<bool>(
              future: loadVideoPlayer(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                      height: 200, child: Chewie(controller: chewieController));
                } else if (snapshot.hasError) {
                  return Text(
                    'Error: $snapshot',
                    style: TextStyle(color: Colors.white),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
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
