import 'package:flutter/material.dart';

class MiniWeatherCard extends StatefulWidget {
  const MiniWeatherCard({super.key});

  @override
  State<MiniWeatherCard> createState() => _MiniWeatherCardState();
}

class _MiniWeatherCardState extends State<MiniWeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 50,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(243, 243, 243, 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Icon(Icons.add, color: Colors.black, size: 15),
        ],
      ),
    );
  }
}
