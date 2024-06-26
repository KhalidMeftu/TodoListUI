import 'package:flutter/material.dart';
import 'package:task_tracker_app_ui/utils/app_colors.dart';
import 'package:task_tracker_app_ui/utils/app_font.dart';
import 'package:task_tracker_app_ui/utils/app_resources.dart';
import 'package:task_tracker_app_ui/utils/app_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Image.asset(AppResources.splashImage),
                    const SizedBox(height: 5,),
                    Text(AppString.getOrganized.toUpperCase(), style: AppFont.large().copyWith(color: Colors.black),),
                    const SizedBox(height: 5,),
                    Text(AppString.aboutApp,textAlign: TextAlign.center, style: AppFont.small().copyWith(color: Colors.black),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Container(
                  width: 220,
                  height: 55,
                  decoration: BoxDecoration(
                      gradient: AppColors.buttonGradient,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(child: Text("Get Started", style: AppFont.medium().copyWith(color: Colors.white),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
