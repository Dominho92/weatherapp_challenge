import 'package:flutter/material.dart';
import 'package:weather_app/home/models/weather.dart';
import 'package:weather_app/home/repositories/weather_repository.dart';
import 'package:weather_app/styles.dart';
import 'package:weather_app/widgets/bottom_tap_bar.dart';
import 'package:weather_app/widgets/weather_card.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key, required this.repository});

  final WeatherRepository repository;

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
            const Text('Wetter Werner', style: TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: TapBar(),
      body: Container(
        decoration: appBackground(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 130),
            SizedBox(
              height: 50,
              width: 340,
              child: TextField(
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                controller: searchController,
                onSubmitted: (value) {
                  setState(() {
                    widget.repository.addCity(value);
                    searchController.clear();
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Find your City or Airport!',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.only(top: 30),
              itemCount: widget.repository.citys.length,
              itemBuilder: (context, index) {
                final item = widget.repository.citys[index];
                return Dismissible(
                    onDismissed: (direction) {
                      setState(() {
                        widget.repository.removeCity(item);
                      });
                    },
                    key: ValueKey(item),
                    background: Container(
                      color: Colors.red,
                      child: Icon(Icons.delete, color: Colors.white, size: 40),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                    ),
                    child: WeatherCard(city: item));
              },
            )),
          ],
        ),
      ),
    );
  }
}
