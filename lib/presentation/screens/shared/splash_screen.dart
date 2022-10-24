
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home_layout/home_layout.dart';

class SplashScreen extends StatefulWidget
{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    Timer(const Duration(seconds: 2), (){
      if(CacheHelper.getDataFromSharedPreference(key: 'UserLoggedIn') !=null &&
          CacheHelper.getDataFromSharedPreference(key: 'UserLoggedIn') ==true)
      {
        Navigator.pushNamedAndRemoveUntil(context, Routes.homeLayout,(route)=>false);
      }else
        {
          Navigator.pushNamed(context, Routes.loginScreen);
        }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.blue[400],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/splash.png',height: 300,width: 300,)),

          ],
        ),
      );

  }
}




//I did splash screen that way because I find a class to it instead
// I used to use flutter native splash screen