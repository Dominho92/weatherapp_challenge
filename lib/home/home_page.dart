import 'package:flutter/material.dart';
import 'package:weather_app/home/repositories/weather_repository.dart';
import 'package:weather_app/styles.dart';
import 'package:weather_app/widgets/bottom_tap_bar.dart';
import 'package:weather_app/widgets/weather_text_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: customAppBar(),
      bottomNavigationBar: TapBar(),
      body: Container(
        decoration: appBackground(),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WeatherTextCard(city: "Oberhausen"),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
