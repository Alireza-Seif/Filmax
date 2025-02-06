import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmax_app/api/api_caller.dart';
import 'package:filmax_app/constants/app_colors.dart';
import 'package:filmax_app/screens/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../models/banners_model.dart';
import '../models/home_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiCaller apiCaller = ApiCaller();
  late Future<List<BannersModel>> bannersList;
  late Future<HomeModel> homeModel;

  @override
  void initState() {
    super.initState();
    bannersList = apiCaller.getBannersList();
    homeModel = apiCaller.getHomeVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<List<BannersModel>>(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Widget> images = [];

                    for (int i = 0; i < snapshot.data!.length; i++) {
                      String banner = snapshot.data![i].bannerImage!;
                      images.add(Image.network(
                        banner,
                        fit: BoxFit.fill,
                      ));
                    }
                    return ImageSlideshow(
                      initialPage: 0,
                      height: 200,
                      width: double.infinity,
                      autoPlayInterval: 3000,
                      indicatorColor: Colors.blue,
                      indicatorBackgroundColor: Colors.grey,
                      children: images,
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Error');
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.orange,
                        color: AppColors.darkOraange,
                      ),
                    );
                  }
                },
                future: bannersList,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Latest videos',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      // height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            height: 250,
                            child: ListView.builder(
                              itemCount: snapshot.data!.featuredVideoList!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PlayerScreen(
                                              video: snapshot
                                                  .data!.featuredVideoList![index]),
                                        ));
                                  },
                                  child: Container(
                                    height: 280,
                                    width: 140,
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl:
                                              '${snapshot.data!.featuredVideoList![index].videoThumbnailS}',
                                          height: 220,
                                          fit: BoxFit.fill,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(
                                            backgroundColor: AppColors.orange,
                                            color: AppColors.darkOraange,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                        Text(
                                          '${snapshot.data!.featuredVideoList![index].videoTitle}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Text(
                      'Error',
                      style: TextStyle(color: Colors.white),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.orange,
                        color: AppColors.darkOraange,
                      ),
                    );
                  }
                },
                future: homeModel,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Special videos',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      // height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            height: 250,
                            child: ListView.builder(
                              itemCount:
                                  snapshot.data!.featuredVideoList!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PlayerScreen(
                                              video: snapshot
                                                  .data!.latestVideo![index]),
                                        ));
                                  },
                                  child: Container(
                                    height: 280,
                                    width: 140,
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl:
                                              '${snapshot.data!.latestVideo![index].videoThumbnailS}',
                                          height: 220,
                                          fit: BoxFit.fill,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(
                                            backgroundColor: AppColors.orange,
                                            color: AppColors.darkOraange,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(
                                            Icons.error,
                                            color: AppColors.darkOraange,
                                            size: 36,
                                          ),
                                        ),
                                        Text(
                                          '${snapshot.data!.latestVideo![index].videoTitle}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Text(
                      'Error',
                      style: TextStyle(color: Colors.white),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.orange,
                        color: AppColors.darkOraange,
                      ),
                    );
                  }
                },
                future: homeModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
