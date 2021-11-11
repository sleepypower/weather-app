import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/Controllers/weather_controller.dart';
import 'package:weather/Data/Local/city_client.dart';
import 'package:weather/Data/Remote/weather_client.dart';
import 'package:weather/View/Widgets/home_widgets.dart';
import 'package:get/get.dart';
import 'package:weather/View/search_screen.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  WeatherController weatherContr = Get.find();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints constraints) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(
                  onPressed: () async {
                    Get.to(SearchScreen());
                    widget.weatherContr.updateWeather();
                  },
                  icon: const Icon(CupertinoIcons.search),
                )
              ],
            ),
            body: Stack(
              children: [
                Image.asset('Assets/night.jpg',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity),
                Column(
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.14,
                    ),
                    Obx(() => Expanded(
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: widget.weatherContr.cities.length,
                            itemBuilder: (ctx, i) => WeatherCityItem(
                              constraints: constraints,
                              index: i,
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
