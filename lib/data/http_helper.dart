import 'package:globo_fitness/data/wearher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HttpHelper{
  // https://api.openweathermap.org/data/2.5/weather?q=Wroclaw&appid=f3b8ebcb30d85d45b4167d1e3f903ebd
  final String authority = 'api.openweathermap.org';
  final String path = '/data/2.5/weather';
  final String apiKey = 'f3b8ebcb30d85d45b4167d1e3f903ebd';

  Future<WeatherModel> getWeather(String city) async {
    Map<String, dynamic> queryParameters = {
      'q': city,
      'appid': apiKey,
    };
    Uri uri = Uri.https(authority, path, queryParameters);
    http.Response response = await http.get(uri);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}