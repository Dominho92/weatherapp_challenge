import 'package:flutter/material.dart';
import 'package:weather_app/home/repositories/weather_repository.dart';
import 'package:weather_app/screens/weather_card_screen.dart';
import 'package:weather_app/widgets/mini_weather_card.dart';

class TapBar extends StatefulWidget {
  TapBar({super.key});

  final WeatherRepository weatherRepository = WeatherRepository();

  @override
  State<TapBar> createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: 400,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/TabBar.png'),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.only(left: 181.5, top: 30.0),
            child: Icon(Icons.add,
                color: Color.fromARGB(255, 85, 85, 85), size: 30),
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/location.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(children: [
                      const SizedBox(width: 45),
                      Image.asset('assets/images/mini1.png',
                          height: 146, width: 60),
                      const SizedBox(width: 20),
                      Image.asset('assets/images/mini2.png',
                          height: 146, width: 60),
                      const SizedBox(width: 20),
                      Image.asset('assets/images/mini3.png',
                          height: 146, width: 60),
                      const SizedBox(width: 20),
                      Image.asset('assets/images/mini1.png',
                          height: 146, width: 60),
                    ]),
                  );
                });
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 40.0, top: 40.0),
            child: Icon(Icons.location_on, color: Colors.white, size: 30),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CardScreen(repository: widget.weatherRepository)));
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 320.0, top: 40.0),
            child: Icon(Icons.list, color: Colors.white, size: 30),
          ),
        ),
      ],
    );
  }
}
