import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:weather/Data/Model/weather_model.dart';


class OpenWeatherWapClient {
  String apiKey;
  OpenWeatherWapClient(this.apiKey);

  Future<WeatherModel> fetchWeatherCity(String city) async {
    String url = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=e718074c196d8c560f0b61f6ea416f30";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var weatherInfo = jsonDecode(response.body);
      print(weatherInfo['main']);
      return WeatherModel(
        description: weatherInfo['weather'][0]['description'],
        feelsLike: weatherInfo['main']['feels_like'],
        temp: weatherInfo['main']['temp'],
        tempMin: weatherInfo['main']['temp_min'],
        tempMax: weatherInfo['main']['temp_max'],
        pressure: weatherInfo['main']['pressure'],
        humidity: weatherInfo['main']['humidity'],
        name: weatherInfo['name'],
        time: weatherInfo['dt'],
        windSpeed: weatherInfo['wind']['speed']
      );
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}