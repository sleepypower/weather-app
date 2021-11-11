class City {
  String country;
  int geonameid;
  String name;
  String subcountry;

  City(
      {required this.country,
      required this.geonameid,
      required this.name,
      required this.subcountry});

  factory City.fromJson(Map<String, dynamic> json) => City(
      country: json['country'],
      geonameid: json['geonameid'],
      name: json['name'],
      subcountry: json['subcountry']);
}
