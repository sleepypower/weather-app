import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/Controllers/weather_controller.dart';
import 'package:weather/Data/Local/city_client.dart';
import 'package:weather/Data/Model/city_model.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchTextController = TextEditingController();
  late List<City> localQueryCities = [];
  var queryController = TextEditingController();

  WeatherController weatherContr = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: LayoutBuilder(
      builder: (BuildContext ctx, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Container(
                height: 42,
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(color: Colors.black26),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  controller: queryController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.grey),
                    suffixIcon: queryController.text.isNotEmpty
                        ? GestureDetector(
                            child: Icon(Icons.close, color: Colors.grey),
                            onTap: () {
                              queryController.clear();
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          )
                        : null,
                    hintText: 'Search for a City',
                    border: InputBorder.none,
                  ),
                  onChanged: (text) async {
                    localQueryCities =
                        await weatherContr.cityClient.getCitiesByQuery(text);
                    setState(() {});
                  },
                ),
              ),
              Column(
                children: <Widget>[
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: localQueryCities.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(localQueryCities[index].name),
                        onTap: () async {
                          String answer = await weatherContr.updateCity(localQueryCities[index].name);
                          print(answer);
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ));
  }
}

