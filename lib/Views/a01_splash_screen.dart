
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infoware_multi_app/Views/a02_validation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ValidationScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.white, Colors.green],
          ),
        ),
        child: const Center(
          child: Text('Multi App', style: TextStyle(color: Colors.red, fontSize: 34, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
        ),
      ),
    );
  }
}
