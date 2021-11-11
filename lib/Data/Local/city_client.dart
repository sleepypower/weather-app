import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:weather/Data/Model/city_model.dart';

class CityClient {
  List<City> cities = [];

  Future<List<City>> getJson() async {
    String data = await rootBundle.loadString('Assets/worldcities.json');
    List jsonResult = json.decode(data);
    List<City> cities = [];
    for (int i = 0; i < jsonResult.length; i++) {
      cities.add(City(
          subcountry: jsonResult[i]['subcountry'] ?? '',
          name: jsonResult[i]['name'],
          geonameid: jsonResult[i]['geonameid'],
          country: jsonResult[i]['country']));
    }
    this.cities = cities;

    return cities;
  }

  Future<List<City>> getCitiesByQuery(String query) async {
    List<City> matchingCities = [];
    query = query.toLowerCase();

    for (int i = 0; i < this.cities.length; i++) {
      if (cities[i].name.toLowerCase().contains(query) &&
          query != "" &&
          matchingCities.length < 5) {
        matchingCities.add(cities[i]);
      } else if (matchingCities.length > 5) {
        break;
      }
    }
    return matchingCities;
  }

  Future<void> onInit() async {
    this.cities = await getJson();
    print("#########");
    print(cities);
  }
}
