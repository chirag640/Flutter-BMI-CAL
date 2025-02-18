import 'dart:async';

import 'package:bmi_calculator/pages/calculator_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), 
    ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CalculatorPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6C63FF),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Text("BMiDO", style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),),
            SizedBox(height: 100,),
            Image.asset('assets/images/splash_screen.png', width: 275, height: 275,),
            SizedBox(height: 100,),
            SizedBox(
              width: 300,
              child: Column(
              children: [
                Text("Get Started with \nTracking Your Health!", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold , wordSpacing: 1.5),),
                SizedBox(height: 30,),
                Text("Calculate your BMI and stay on top of \nyour wellness journey, effortlessly.", style: TextStyle(fontSize: 15, color: Colors.white70, wordSpacing: 1),),
              ],
            )),
          ],
        ),
      ),
    );
  }
}