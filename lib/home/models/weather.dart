part 'weather.g.dart';

class Weather {
  final String? city;
  final double? temp;
  final double? feels_Like;
  final double? humidity;
  final double? max_temp;
  final double? min_temp;

  Weather(
      {required this.city,
      required this.temp,
      required this.feels_Like,
      required this.humidity,
      required this.max_temp,
      required this.min_temp});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
