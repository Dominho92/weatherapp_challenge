import 'package:flutter/material.dart';

appBackground() {
  return const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover));
}

const headLine = TextStyle(
  fontSize: 65,
  fontWeight: FontWeight.w200,
  color: Colors.white,
);

const subHeadLine = TextStyle(
  fontSize: 25,
  color: Colors.white,
);

const underHeadline = TextStyle(
  fontSize: 15,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const cardHeadLine = TextStyle(
  fontSize: 35,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

customAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Text('Wetter Werner', style: TextStyle(color: Colors.white)),
  );
}
