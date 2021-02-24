import 'dart:convert';
import 'package:http/http.dart' as http;

class Cuaca {
  String main;
  String description;
  String temp;
  String feels_like;
  String temp_min;
  String temp_max;
  String pressure;
  String humidity;

  Cuaca(
      {this.main,
      this.description,
      this.temp,
      this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity});

  factory Cuaca.tampung(Map<String, dynamic> object) {
    return Cuaca(main: object["main"], description: object["description"]);
  }

  factory Cuaca.tampung2(Map<String, dynamic> object) {
    return Cuaca(
        temp: object["temp"].toString(),
        feels_like: object["feels_like"].toString(),
        temp_min: object["temp_min"].toString(),
        temp_max: object["temp_max"].toString(),
        pressure: object["pressure"].toString(),
        humidity: object["humidity"].toString());
  }

  static Future<Cuaca> connectToAPI(String namakota) async {
    String apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$namakota&appid=6474724a15241bfa7ae0a1820858ac37';

    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);
    var dataCuaca = (jsonObject as Map<String, dynamic>)['weather'][0];
    return Cuaca.tampung(dataCuaca);
  }

  static Future<Cuaca> connectToAPI2(String namakota) async {
    String apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$namakota&appid=6474724a15241bfa7ae0a1820858ac37';

    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);
    var dataTemp = (jsonObject as Map<String, dynamic>)["main"];
    return Cuaca.tampung2(dataTemp);
  }
}
