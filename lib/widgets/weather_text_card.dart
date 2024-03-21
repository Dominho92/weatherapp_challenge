import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/home/models/weather.dart';
import 'package:weather_app/home/repositories/weather_repository.dart';
import 'package:weather_app/styles.dart';

class WeatherTextCard extends StatefulWidget {
  const WeatherTextCard({super.key, required this.city});

  final String city;

  @override
  State<WeatherTextCard> createState() => _WeatherTextCardState();
}

class _WeatherTextCardState extends State<WeatherTextCard> {
  late final Future<Weather> weatherData;
  @override
  void initState() {
    super.initState();
    weatherData = WeatherRepository().getWeather(widget.city);
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder<Weather>(
            future: weatherData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        widget.city,
                        style: subHeadLine,
                      ),
                      Text('${snapshot.data!.temp}°', style: headLine),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Max: ${snapshot.data!.max_temp}°',
                              style: underHeadline),
                          const SizedBox(width: 15),
                          Text('Min: ${snapshot.data!.min_temp}°',
                              style: underHeadline),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
