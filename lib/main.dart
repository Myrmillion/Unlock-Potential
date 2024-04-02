import 'package:flutter/material.dart';
import 'package:unlock_potential/pages/about_page.dart';
import 'package:unlock_potential/pages/battery_page.dart';
import 'package:unlock_potential/pages/device_page.dart';
import 'package:unlock_potential/pages/home_page.dart';
import 'package:unlock_potential/utils/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'utils/color_schemes.g.dart';
import 'pages/sensor_page.dart';

void main() async {
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ThemeCubit())],
      child: const UnlockPotential(),
    ),
  );
}

class UnlockPotential extends StatelessWidget {
  const UnlockPotential({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (_, state) {
        if (state is ThemeDefined) {
          return MaterialApp(
            title: 'Sensor Usage',
            debugShowCheckedModeBanner: false,
            themeMode: state.mode,
            theme: ThemeData(useMaterial3: true, colorScheme: lightScheme),
            darkTheme: ThemeData(useMaterial3: true, colorScheme: darkScheme),
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
        return const SizedBox.shrink();
      },
    );
  }
}
