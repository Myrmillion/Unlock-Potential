import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Cubit

/// A cubit to manage the theme of the application.
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const Initial()) {
    _init();
  }

  /// Initialize the theme.
  void _init() async {
    final prefs = await SharedPreferences.getInstance();
    late final bool isDark;

    if (prefs.containsKey('dark-mode')) {
      isDark = prefs.getBool('dark-mode') ?? false;
    } else {
      final brightness = PlatformDispatcher.instance.platformBrightness;
      isDark = (brightness == Brightness.dark);
    }

    await prefs.setBool('dark-mode', isDark);
    emit(ThemeDefined(isDark));
  }

  /// Toggle the theme.
  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('dark-mode') ?? false;

    await prefs.setBool('dark-mode', !isDark);
    emit(ThemeDefined(!isDark));
  }
}

// State

/// The state of the theme.
@immutable
sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

final class Initial extends ThemeState {
  const Initial();
}

final class ThemeDefined extends ThemeState {
  ThemeDefined(this.isDark);

  final bool isDark;
  late final ThemeMode mode = isDark ? ThemeMode.dark : ThemeMode.light;

  @override
  List<Object> get props => [isDark, mode];
}
