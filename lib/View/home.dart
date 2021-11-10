import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/Data/Remote/weather_client.dart';
import 'package:weather/View/Widgets/home_widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              leading: IconButton(
                onPressed: () async {
                  var client =
                      OpenWeatherWapClient('e718074c196d8c560f0b61f6ea416f30');
                  client.fetchWeatherCity('zipaquira');
                },
                icon: const Icon(CupertinoIcons.search),
              ),
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
                      height: constraints.maxHeight * 0.175,
                    ),
                    Expanded(
                      child: PageView.builder(
                        itemBuilder: (ctx, i) => WeatherCityItem(constraints: constraints),
                      ),
                    ),
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
