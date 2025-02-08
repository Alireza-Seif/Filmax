import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmax_app/api/api_caller.dart';
import 'package:filmax_app/constants/app_colors.dart';
import 'package:filmax_app/models/category_model.dart';
import 'package:filmax_app/screens/player_screen.dart';
import 'package:flutter/material.dart';

import '../models/video_model.dart';

class CategoryVideosScreen extends StatefulWidget {
  final CategoryModel category;

  const CategoryVideosScreen({super.key, required this.category});

  @override
  State<CategoryVideosScreen> createState() => _CategoryVideosScreenState();
}

class _CategoryVideosScreenState extends State<CategoryVideosScreen> {
  late Future<List<VideoModel>> getVideos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVideos = ApiCaller().getVideos(widget.category.cId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text('${widget.category.categoryName}'),
        backgroundColor: AppColors.darkOrange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: FutureBuilder<List<VideoModel>>(
          future: getVideos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlayerScreen(video: snapshot.data![index]),
                          ));
                    },
                    child: SizedBox(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                '${snapshot.data![index].videoThumbnailB}',
                            width: 220,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            '${snapshot.data![index].videoTitle}',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error');
            } else {
              return CircularProgressIndicator(
                backgroundColor: AppColors.orange,
                color: AppColors.darkOrange,
              );
            }
          },
        ),
      ),
    );
  }
}
