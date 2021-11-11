import 'package:get/get.dart';
import 'package:weather/Data/Local/city_client.dart';
import 'package:weather/Data/Local/local_repository.dart';
import 'package:weather/Data/Remote/weather_client.dart';
import 'package:weather/View/Widgets/home_widgets.dart';

class WeatherController extends GetxController {

  // This list will contain only the saved city names
  var cities = [].obs;
  var citiesInfo = [].obs;
  var lol = [];

  // local data base city repository
  LocalDataSource localCities = LocalDataSource();

  // City Client
  CityClient cityClient = CityClient();


  // the red screen on start is thanks to this,
  @override
  Future onInit() async {
    super.onInit();
    await updateWeather();
    cityClient.getJson();
    await localCities.database;
    print("Init");
    await localCities.updateCities();
    cities.value = localCities.currentCities;
    cities.refresh();
    updateWeather();
  }

  // Open weather client
  OpenWeatherWapClient weatherClient = OpenWeatherWapClient('e718074c196d8c560f0b61f6ea416f30');

  Future<String> updateCity(String cityName) async {
    String response = await localCities.updateCity(cityName);
    cities.assignAll(localCities.currentCities);
    cities.refresh();
    await updateWeather();

    return response;
  }


  Future<bool> updateWeather() async {
    try {
      for (int i = 0; i < cities.length; i++) {
        String cityName = cities[i];
        var model = await weatherClient.fetchWeatherCity(cityName);
        try {
          citiesInfo[i] = model;
        } catch (e) {
          citiesInfo.add(model);
        }
      }
    } catch (e) {
      print(e);
      return Future.value(false);
    }

    // Notify changes to the listeners
    cities.refresh();
    citiesInfo.refresh();
    return Future.value(true);

  }

}