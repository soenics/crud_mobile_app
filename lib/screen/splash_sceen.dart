import 'package:crud_mobile_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashSceen extends StatefulWidget {
  const SplashSceen({super.key});

  @override
  State<SplashSceen> createState() => _SplashSceenState();
}

class _SplashSceenState extends State<SplashSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0EBE3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text("My Note APP",style: GoogleFonts.merriweather(fontSize: 40)),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image(image: AssetImage('assets/images/splash_image.jpg',)),
            ),
          ),
    
          GestureDetector(
            onTap: (){
              Get.to(()=>HomeScreen(),transition: Transition.fade,duration: Duration(seconds: 1));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
                child: Text("GET STARTED",style: TextStyle(color: Colors.black,fontSize: 20),),
              ),
            ),
          )
        ],
        ),
      ),
    
    );
  }
}