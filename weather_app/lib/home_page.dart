import 'package:flutter/material.dart';
import 'package:weather_app/data_service.dart';
import 'package:weather_app/models.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _cityTextController = TextEditingController();
  final _dataService = DataService();

   WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(_response != null)
              Column(
                children: [
                  Image.network(_response!.iconUrl),
                  Text(_response!.cityName,
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(
                    '${_response!.weatherInfo.description}',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    '${_response!.tempInfo.temperature}',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 150,
                child: TextField(
                  controller: _cityTextController,
                  decoration: InputDecoration(
                    labelText: 'city'
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  _search();
                },
                child: Text("search"),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _search() async {
    final response = await _dataService.getData(_cityTextController.text);
    print(response.cityName);
    print(response.tempInfo.temperature);
    print(response.weatherInfo.description);
    setState(() => _response = response);
  }
}
