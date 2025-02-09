import 'package:filmax_app/api/api_caller.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';

  String password = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.darkOrange,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Login at Filmax',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: AppColors.darkOrange,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.darkOrange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.orange),
                    ),
                    hintText: 'Email'),
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 10),
              TextField(
                cursorColor: AppColors.darkOrange,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.darkOrange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.orange),
                    ),
                    hintText: 'Password'),
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkOrange,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Login'),
                  onPressed: () async {
                    await ApiCaller().login(email, password).then((value) {
                      if (value.success == '1') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('You have successfully logged in'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Error')));
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
