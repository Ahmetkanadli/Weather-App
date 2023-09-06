class WeatherInfo{

  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json){
    final description = json['description'];
    final icon = json['icon'];

    return WeatherInfo(description: description, icon: icon);
  }
}


class TempratureInfo{
  final double temperature;

  TempratureInfo({required this.temperature});

  factory TempratureInfo.fromJson(Map<String, dynamic> json){

    final temperature = json['temp'];
    return TempratureInfo(temperature: temperature);
  }
}


class WeatherResponse{

  final String cityName;
  final TempratureInfo tempInfo;
  final WeatherInfo weatherInfo;

  String get iconUrl{
    return 'https://openweathermap.org/img/wn/10d@2x.png';
  }

  WeatherResponse({required this.cityName, required this.tempInfo,required this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String ,dynamic> json){
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TempratureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(cityName: cityName, tempInfo:tempInfo,weatherInfo: weatherInfo);
  }
}