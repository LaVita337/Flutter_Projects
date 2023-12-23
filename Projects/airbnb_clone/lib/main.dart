import 'package:airbnb_clone/screens/home/home.dart';
import 'package:airbnb_clone/screens/seoul/seoul_detail.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Airbnb UI Clone',
        theme: ThemeData(fontFamily: 'AirbnbCereal'),
        routes: {
          '/': (context) => HomePage(),
          '/seoul': (context) => const SeoulDetail(),
        });
  }
}
