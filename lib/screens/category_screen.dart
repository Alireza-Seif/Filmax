import 'package:filmax_app/api/api_caller.dart';
import 'package:filmax_app/constants/app_colors.dart';
import 'package:filmax_app/models/category_model.dart';
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
      body: Container(
        child: Column(
          children: [
            FutureBuilder<List<CategoryModel>>(
              future: categoryList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    child: Text('${snapshot.data!.length}'),
                  );
                } else if (snapshot.hasError) {
                  return Text('error');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
