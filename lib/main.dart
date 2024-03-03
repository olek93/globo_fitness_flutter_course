import 'package:flutter/material.dart';
import 'package:globo_fitness/screens/bmi_screen.dart';
import 'package:globo_fitness/screens/intro_screen.dart';
import 'package:globo_fitness/screens/weather_screen.dart';
import 'package:globo_fitness/shared/singleton_tools/route_observer.dart';

void main() => runApp(const GlobeApp());

class GlobeApp extends StatelessWidget {
  const GlobeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(colorSchemeSeed: Colors.amber),
        navigatorObservers: [GloboRouteObserver()],
        routes: {
          "/": (context) => const IntroScreen(),
          "/bmi": (context) => const BmiScreen(),
          "/weather": (context) => const WeatherScreen(),
        },
        initialRoute: "/",
    );
  }
}
