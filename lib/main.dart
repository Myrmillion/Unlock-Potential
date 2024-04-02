import 'package:flutter/material.dart';
import 'package:unlock_potential/pages/about_page.dart';
import 'package:unlock_potential/pages/battery_page.dart';
import 'package:unlock_potential/pages/device_page.dart';
import 'package:unlock_potential/pages/home_page.dart';

import 'utils/color_schemes.g.dart';
import 'pages/sensor_page.dart';

void main() {
  runApp(const SensorUsage());
}

class SensorUsage extends StatelessWidget {
  const SensorUsage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensor Usage',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/device': (_) => const DevicePage(),
        '/sensors': (_) => const SensorsPage(),
        '/battery': (_) => const BatteryPage(),
        '/about': (_) => const AboutPage(),
      },
    );
  }
}
