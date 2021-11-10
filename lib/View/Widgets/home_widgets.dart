import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherStatisticItem extends StatefulWidget {
  var constraints;

  WeatherStatisticItem({Key? key, this.constraints}) : super(key: key);

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
                    Icon(
                      CupertinoIcons.thermometer,
                      color: Colors.white.withOpacity(0.08),
                    ),
                    Text(
                      "HUMIDITY",
                      style: GoogleFonts.inter(
                          fontSize: widget.constraints.maxWidth * 0.035,
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
                    "11°",
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
              "Simlar to the actual temperature",
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

  WeatherCityItem({Key? key, this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      children: [
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Bogotá",
                style: GoogleFonts.inter(
                    fontSize: constraints.maxWidth * 0.11,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ),
            Text(
              "11°",
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
                  "11:18 pm",
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
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut iaculis risus orci, non consequat nulla pulvinar",
                style: GoogleFonts.inter(
                    fontSize: constraints.maxWidth * 0.04,
                    fontWeight: FontWeight.w200,
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
        Row(
          children: [
            Flexible(child: WeatherStatisticItem(constraints: constraints)),
            Flexible(child: WeatherStatisticItem(constraints: constraints)),
          ],
        ),
        Row(
          children: [
            Flexible(child: WeatherStatisticItem(constraints: constraints)),
            Flexible(child: WeatherStatisticItem(constraints: constraints)),
          ],
        ),
        Row(
          children: [
            Flexible(child: WeatherStatisticItem(constraints: constraints)),
            Flexible(child: WeatherStatisticItem(constraints: constraints)),
          ],
        ),
      ],
    );
  }
}
