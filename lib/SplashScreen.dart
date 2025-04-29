import 'dart:async';
import 'package:flutter/material.dart';
import 'Home.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 10),(){
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context)=>DefaultTabController(length: 2, child: Home())),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Image(image: AssetImage("assets/images/logo.png"),
                  width: 100,
                  height: 100,
                ),
              SizedBox(height: 100,),
              Text("Konnectly",
              style:TextStyle(
                fontSize: 30,
                fontFamily: 'Lexend'
              ),),
              SizedBox(height: 25,),
              CircularProgressIndicator(
                color: Color(0xFFff0030),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// DefaultTabController(length: 2, child: Home()),