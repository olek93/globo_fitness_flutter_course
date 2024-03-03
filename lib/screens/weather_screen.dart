import 'package:flutter/material.dart';
import 'package:globo_fitness/data/http_helper.dart';
import 'package:globo_fitness/data/wearher.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityNameTxtController = TextEditingController();
  WeatherModel response = WeatherModel(
    cityName: "",
    description: "",
    temperature: 0,
    perceivedTemperature: 0,
    humidity: 0,
    pressure: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: _cityNameTxtController,
                    decoration: InputDecoration(
                        labelText: 'City',
                        hintText: 'Enter city name',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: getData,
                            icon: const Icon(Icons.search))),
                  ),
                ),
                weatherRow('City', response.cityName),
                weatherRow('Description', response.description),
                weatherRow('Temperature', response.temperature.toStringAsFixed(2)),
                weatherRow('Perceived Temperature',
                    response.perceivedTemperature.toStringAsFixed(2)),
                weatherRow('Humidity', response.humidity.toString()),
                weatherRow('Pressure', response.pressure.toString()),
              ],
            )));
  }

  void getData() async {
    HttpHelper helper = HttpHelper();
    var res = await helper.getWeather(_cityNameTxtController.text);
    setState(() {
      response = res;
    });
  }

  Widget weatherRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style:
                  TextStyle(fontSize: 20.0, color: Theme.of(context).hintColor),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 20.0, color: Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
