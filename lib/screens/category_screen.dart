import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmax_app/api/api_caller.dart';
import 'package:filmax_app/constants/app_colors.dart';
import 'package:filmax_app/models/category_model.dart';
import 'package:filmax_app/screens/category_videos_screen.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<CategoryModel>> categoryList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryList = ApiCaller().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: FutureBuilder<List<CategoryModel>>(
          future: categoryList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryVideosScreen(
                                category: snapshot.data![index],
                              ),
                            ));
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  '${snapshot.data![index].categoryImage}',
                              fit: BoxFit.fill,
                              height: 160,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(
                                backgroundColor: AppColors.orange,
                                color: AppColors.darkOrange,
                              ),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                                color: AppColors.darkOrange,
                                size: 36,
                              ),
                            ),
                            Text(
                              '${snapshot.data![index].categoryName}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: 'BYekanBoled',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return const Text('error');
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
