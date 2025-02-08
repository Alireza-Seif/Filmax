import 'package:filmax_app/constants/app_colors.dart';
import 'package:filmax_app/screens/category_screen.dart';
import 'package:filmax_app/screens/home_screen.dart';
import 'package:filmax_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: const Text('Filmax',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 42),),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.orange ,
      ),
      body: _screens.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.darkOrange,
        unselectedItemColor: Colors.white,
        backgroundColor: AppColors.bg,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }
}
