class WeatherModel {
  String cityName = '';
  String description = '';
  double temperature = 0.0;
  double perceivedTemperature = 0.0;
  int humidity = 0;
  int pressure = 0;

  WeatherModel(
      {required this.cityName,
      required this.description,
      required this.temperature,
      required this.perceivedTemperature,
      required this.humidity,
      required this.pressure});

  WeatherModel.fromJson(Map<String, dynamic> weatherMap) {
    if (weatherMap['cod'] != 200) {
      cityName = 'Unknown';
      description = weatherMap['message'] ?? 'Unknown';
      temperature = 0.0;
      perceivedTemperature = 0.0;
      humidity = 0;
      pressure = 0;
    } else {
      _parseWeatherMap(weatherMap);
    }
  }

  void _parseWeatherMap(Map<String, dynamic> weatherMap) {
    cityName = _getWeatherMapValueOrUnknown(
        weatherMap, 'name');
    description = _getWeatherMapValueOrUnknown(
        weatherMap,
        'weather',
        (weatherData) =>
            weatherData.isNotEmpty ? weatherData[0]['description'] : null);
    temperature = _getWeatherMapValueOrZero(
        weatherMap, 'main', (mainData) => mainData['temp'] - 273.15);
    perceivedTemperature = _getWeatherMapValueOrZero(
        weatherMap, 'main', (mainData) => mainData['feels_like'] - 273.15);
    humidity = _getWeatherMapValueOrZero(
        weatherMap, 'main', (mainData) => mainData['humidity']);
    pressure = _getWeatherMapValueOrZero(
        weatherMap, 'main', (mainData) => mainData['pressure']);
  }

  dynamic _getWeatherMapValueOrUnknown(
      Map<String, dynamic> weatherMap, String key,
      [String Function(dynamic)? transformFunction]) {
    // Check if the key exists and has a non-null value
    if (weatherMap[key] != null) {
      // If a transform function is provided, use it
      if (transformFunction != null) {
        return transformFunction(weatherMap[key]);
      } else {
        // If no transform function is provided, return the value directly
        // This assumes the value is a String or can be treated as such
        return weatherMap[key];
      }
    } else {
      // Return 'Unknown' if the key doesn't exist or the value is null
      return 'Unknown';
    }
  }

  dynamic _getWeatherMapValueOrZero(Map<String, dynamic> weatherMap, String key,
      [num Function(dynamic)? transformFunction]) {
    // Check if the key exists and has a non-null value
    if (weatherMap[key] != null) {
      // If a transform function is provided, use it
      if (transformFunction != null) {
        return transformFunction(weatherMap[key]);
      } else {
        // If no transform function is provided, return the value directly
        // This assumes the value is a String or can be treated as such
        return weatherMap[key];
      }
    } else {
      // Return 'Unknown' if the key doesn't exist or the value is null
      return 0;
    }
  }
}
