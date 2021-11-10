

import 'package:flutter/material.dart';

class WeatherModel {
  String description;
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
  String name;
  int time;

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

  });


}

