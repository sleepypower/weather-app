

import 'package:flutter/material.dart';

class WeatherModel {
  String description;
  num temp;
  num feelsLike;
  num tempMin;
  num tempMax;
  num pressure;
  num humidity;
  String name;
  num time;
  num windSpeed;

  WeatherModel({
    required this.description,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.name,
    required this.time,
    required this.feelsLike,
    required this.windSpeed

  });


}

