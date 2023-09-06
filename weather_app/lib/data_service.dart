import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models.dart';

class DataService{
  //https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}
  Future<WeatherResponse> getData(String city) async {

    final queryParameters = {
      'q' : city,
      'appid' : 'write your api here'
    };

    final uri = Uri.https(
        'api.openweathermap.org' , '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}