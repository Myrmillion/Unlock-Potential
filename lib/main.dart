import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:unlock_potential/pages/about_page.dart';
import 'package:unlock_potential/pages/battery_page.dart';
import 'package:unlock_potential/pages/device_page.dart';
import 'package:unlock_potential/pages/home_page.dart';
import 'package:unlock_potential/utils/language_cubit.dart';
import 'package:unlock_potential/utils/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'generated/l10n.dart';
import 'utils/color_schemes.g.dart';
import 'pages/sensor_page.dart';

void main() async {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
      ],
      child: const UnlockPotential(),
    ),
  );
}

class UnlockPotential extends StatelessWidget {
  const UnlockPotential({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (_, themeState) {
        if (themeState is ThemeDefined) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (_, languageState) {
              if (languageState is LanguageDefined) {
                return MaterialApp(
                  title: S.current
                      .appName, // need more searches between S.current and S.of(context)
                  debugShowCheckedModeBanner: false,
                  themeMode: themeState.mode,
                  theme: ThemeData(
                    useMaterial3: true,
                    colorScheme: lightScheme,
                  ),
                  darkTheme:
                      ThemeData(useMaterial3: true, colorScheme: darkScheme),
                  initialRoute: '/',
                  routes: {
                    '/': (_) => const HomePage(),
                    '/device': (_) => const DevicePage(),
                    '/sensors': (_) => const SensorsPage(),
                    '/battery': (_) => const BatteryPage(),
                    '/about': (_) => const AboutPage(),
                  },
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  locale: Locale(languageState.locale),
                );
              }
              return const SizedBox.shrink();
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
