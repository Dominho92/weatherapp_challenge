import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/home/models/weather.dart';
import 'package:weather_app/home/repositories/weather_repository.dart';
import 'package:weather_app/styles.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({
    super.key,
    required this.city,
  });

  final String city;

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  late final Future<Weather> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = WeatherRepository().getWeather(widget.city);
  }

  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/weatherCard.png'),
              ),
            ),
            width: 342,
            height: 155,
            child: Column(
              children: [
                FutureBuilder<Weather>(
                  future: weatherData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return Stack(
                        children: [
                          Positioned(
                            left: 120,
                            bottom: 5,
                            child: snapshot.data!.temp! <= 20
                                ? Image.asset('assets/images/suncloudrain.png',
                                    height: 130, width: 130)
                                : Image.asset('assets/images/mooncloudrain.png',
                                    height: 130, width: 130),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 168.0, top: 35.0),
                                child: Column(
                                  children: [
                                    Text('${snapshot.data!.temp}°',
                                        style: cardHeadLine),
                                    Text('Feels: ${snapshot.data!.feels_Like}°',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 190, 184, 184),
                                            fontSize: 15)),
                                    Text(widget.city,
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.white)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return const Text('No Data aviable');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
