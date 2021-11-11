import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/View/home.dart';
import 'package:weather/View/search_screen.dart';

import 'Controllers/weather_controller.dart';

void main() async{
  Get.put(WeatherController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      getPages: [
        GetPage(name: '/Home', page: () => Home()),
        GetPage(name: '/Search', page: () => SearchScreen()),

      ],
    );
  }
}
