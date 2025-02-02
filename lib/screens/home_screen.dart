import 'package:filmax_app/api/api_caller.dart';
import 'package:flutter/material.dart';

import '../models/banners_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiCaller apiCaller = ApiCaller();
  late Future<List<BannersModel>> bannersList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bannersList = apiCaller.getBannersList();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
