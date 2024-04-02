import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
    late final bool useDark;

    if (prefs.containsKey('dark-mode')) {
      useDark = prefs.getBool('dark-mode') ?? false;
    } else {
      final brightness = PlatformDispatcher.instance.platformBrightness;
      useDark = (brightness == Brightness.dark);
    }

    await prefs.setBool('dark-mode', useDark);
    emit(ThemeDefined(useDark));
  }

  /// Toggle the theme.
  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final useDark = prefs.getBool('dark-mode') ?? false;

    await prefs.setBool('dark-mode', !useDark);
    emit(ThemeDefined(!useDark));
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
  ThemeDefined(this.useDark);

  final bool useDark;
  late final ThemeMode themeMode = useDark ? ThemeMode.dark : ThemeMode.light;

  @override
  List<Object> get props => [useDark, themeMode];
}
