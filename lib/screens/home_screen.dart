import 'package:filmax_app/api/api_caller.dart';
import 'package:filmax_app/constants/app_colors.dart';
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
                  return const CircularProgressIndicator();
                }
              },
              future: bannersList,
            ),
            Container(
              margin: EdgeInsets.all(10),
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
                          height: 280,
                          child: ListView.builder(
                            itemCount: snapshot.data!.featuredVideoList!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 280,
                                width: 140,
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Image.network(
                                      '${snapshot.data!.featuredVideoList![index].videoThumbnailS}',
                                      height: 220,
                                      fit: BoxFit.fill,
                                    )
                                  ],
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
                  return const CircularProgressIndicator();
                }
              },
              future: homeModel,
            ),
          ],
        ),
      ),
    );
  }
}
