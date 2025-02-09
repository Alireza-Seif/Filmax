import 'package:filmax_app/api/api_caller.dart';
import 'package:filmax_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name = '';

  String email = '';

  String phone = '';

  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.darkOrange,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Register at Filmax',
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
                    hintText: 'User Name'),
                onChanged: (value) {
                  name = value;
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
                    hintText: 'Phone Number    '),
                onChanged: (value) {
                  phone = value;
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
                  child: Text('Shin up'),
                  onPressed: () {
                    ApiCaller().register(name, email, phone, password).then(
                      (value) {
                        if (value.success == '1') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(value.msg!),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Error')));
                        }
                      },
                    );
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
