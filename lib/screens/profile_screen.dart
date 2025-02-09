import 'package:filmax_app/constants/app_setting.dart';
import 'package:filmax_app/screens/authentication/login_screen.dart';
import 'package:filmax_app/screens/authentication/register_screen.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLogged = false;
  AppSetting appSetting = AppSetting();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: FutureBuilder<bool>(
          future: appSetting.isUserLogged(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == true) {
                isLogged = true;
              }
              return userStatues();
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

  Widget userStatues() {
    if (isLogged) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<String>(
              future: appSetting.getUserName(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    '${snapshot.data}',
                    style: TextStyle(color: Colors.white),
                  );
                } else {
                  return Text('Error', style: TextStyle(color: Colors.white));
                }
              },
            ),
            FutureBuilder<String>(
              future: appSetting.getUserEmail(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    '${snapshot.data}',
                    style: TextStyle(color: Colors.white),
                  );
                } else {
                  return Text('Error', style: TextStyle(color: Colors.white));
                }
              },
            ),
          ],
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You are not logged in yet',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkOrange),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ));
                },
                child: Text(
                  'Signup',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkOrange),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}
