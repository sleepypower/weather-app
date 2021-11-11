import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/Controllers/weather_controller.dart';

class WeatherStatisticItem extends StatefulWidget {
  var constraints;
  String title = "";
  Icon icon;
  var value;
  String description = "";

  WeatherStatisticItem(
      {Key? key,
      this.constraints,
      required this.title,
      required this.icon,
      required this.value,
      required this.description})
      : super(key: key);

  @override
  State<WeatherStatisticItem> createState() => _WeatherStatisticItemState();
}

class _WeatherStatisticItemState extends State<WeatherStatisticItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 200,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    widget.icon,
                    Text(
                      widget.title,
                      style: GoogleFonts.inter(
                          fontSize: widget.constraints.maxWidth * 0.04,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 0.001,
                          color: Colors.white.withOpacity(0.35)),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "${widget.value}",
                    style: GoogleFonts.inter(
                        fontSize: widget.constraints.maxWidth * 0.075,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 0.001,
                        color: Colors.white),
                  ),
                )
              ],
            ),
            Text(
              "${widget.description}",
              style: GoogleFonts.inter(
                  fontSize: widget.constraints.maxWidth * 0.04,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.001,
                  color: Colors.white),
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white10),
          color: Colors.black54.withOpacity(0.25),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}

class WeatherCityItem extends StatelessWidget {
  var constraints;
  var index;
  WeatherController weatherContr = Get.find();

  WeatherCityItem({Key? key, this.constraints, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Index is $index");
    return Container(
      child: Obx(() => ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            children: [
              Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${weatherContr.citiesInfo[index].name}",
                        style: GoogleFonts.inter(
                            fontSize: constraints.maxWidth * 0.11,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      )),
                  Text(
                    "${weatherContr.citiesInfo[index].temp}°",
                    style: GoogleFonts.inter(
                        fontSize: constraints.maxWidth * 0.175,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 0.001,
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.clock, color: Colors.white),
                      Container(
                        width: constraints.maxWidth * 0.0175,
                      ),
                      Text(
                        "${weatherContr.citiesInfo[index].time}",
                        style: GoogleFonts.inter(
                            fontSize: constraints.maxWidth * 0.05,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.001,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Container(
                    height: constraints.maxHeight * 0.075,
                  )
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                  children: [
                    Align(
                      child: Text(
                        "Weather report",
                        style: GoogleFonts.inter(
                            fontSize: constraints.maxWidth * 0.055,
                            fontWeight: FontWeight.w200,
                            letterSpacing: 0.001,
                            color: Colors.white),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Divider(
                        color: Colors.white54,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${weatherContr.citiesInfo[index].description}",
                        style: GoogleFonts.inter(
                            fontSize: constraints.maxWidth * 0.04,
                            fontWeight: FontWeight.w200,
                            letterSpacing: 0.001,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white10),
                  color: Colors.black54.withOpacity(0.25),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.01,
              ),
              Row(
                children: [
                  Flexible(
                      child: WeatherStatisticItem(
                    constraints: constraints,
                    icon: Icon(
                      CupertinoIcons.thermometer,
                      color: Colors.white.withOpacity(0.08),
                    ),
                    title: "Humidity",
                    value: "${weatherContr.citiesInfo[index].humidity} %",
                    description: "",
                  )),
                  Flexible(
                      child: WeatherStatisticItem(
                    constraints: constraints,
                    icon: Icon(
                      CupertinoIcons.thermometer,
                      color: Colors.white.withOpacity(0.08),
                    ),
                    title: "Feels Like",
                    value: "${weatherContr.citiesInfo[index].feelsLike}°",
                    description: "",
                  )),
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: WeatherStatisticItem(
                    constraints: constraints,
                    icon: Icon(
                      CupertinoIcons.thermometer,
                      color: Colors.white.withOpacity(0.08),
                    ),
                    title: "High",
                    value: "${weatherContr.citiesInfo[index].tempMax}°",
                    description: "",
                  )),
                  Flexible(
                      child: WeatherStatisticItem(
                    constraints: constraints,
                    icon: Icon(
                      CupertinoIcons.thermometer,
                      color: Colors.white.withOpacity(0.08),
                    ),
                    title: "Low",
                    value: "${weatherContr.citiesInfo[index].tempMin}°",
                    description: "",
                  )),

                ],

              ),
              Row(
                children: [
                  Flexible(child: WeatherStatisticItem(constraints: constraints, icon: Icon(
                    CupertinoIcons.rectangle_compress_vertical,
                    color: Colors.white.withOpacity(0.08),
                  ), title: "Pressure", value: "${weatherContr.citiesInfo[index].pressure} hPa", description: "",)),
                  Flexible(child: WeatherStatisticItem(constraints: constraints, icon: Icon(
                    CupertinoIcons.wind,
                    color: Colors.white.withOpacity(0.08),
                  ), title: "Wind Speed", value: "${weatherContr.citiesInfo[index].windSpeed} km/h", description: "",)),
                ],
              ),
            ],
          )),
    );
  }
}
