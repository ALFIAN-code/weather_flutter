class WeatherModel {
  // String city;
  String mainWeather;
  int temperature;
  int humidity;
  double windSpeed;
  int feelsLike;
  int pressure;

  WeatherModel(
      {
      // required this.city,
      required this.feelsLike,
      required this.humidity,
      required this.mainWeather,
      required this.temperature,
      required this.windSpeed,
      required this.pressure});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        // city: json['name'],
        feelsLike: json['main']['feels_like'].round(),
        humidity: json['main']['humidity'],
        mainWeather: json['weather'][0]['main'],
        temperature: json['main']['temp'].round(),
        windSpeed: json['wind']['speed'],
        pressure: json['main']['pressure']);
  }
}
