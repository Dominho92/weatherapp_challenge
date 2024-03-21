// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      city: json['city'] as String?,
      temp: (json['temp'] as num?)?.toDouble(),
      feels_Like: (json['feels_like'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      max_temp: (json['max_temp'] as num?)?.toDouble(),
      min_temp: (json['min_temp'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'city': instance.city,
      'temp': instance.temp,
      'feels_like': instance.feels_Like,
      'humidity': instance.humidity,
      'max_Temp': instance.max_temp,
      'min_Temp': instance.min_temp,
    };
