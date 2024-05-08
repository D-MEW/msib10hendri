import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Background Image Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('img/s.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}