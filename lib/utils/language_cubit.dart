import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unlock_potential/generated/l10n.dart';

// Cubit

/// A cubit to manage the language of the application.
class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageInit()) {
    _init();
  }

  static const _defautLocale = 'en';

  late final SharedPreferences prefs;
  static late String currentLocale;

  /// Initialize the language.
  void _init() async {
    prefs = await SharedPreferences.getInstance();

    late final String locale;

    // If preferred language is set, use it.
    if (prefs.containsKey('locale')) {
      locale = prefs.getString('locale') ?? _defautLocale;
    }
    // Otherwise, use system locale if supported or default.
    else {
      final sysLoc = Intl.systemLocale.split('_')[0];
      locale = S.delegate.isSupported(Locale(sysLoc)) ? sysLoc : _defautLocale;
    }

    await _setLocale(locale);
  }

  /// Change the language.
  Future<void> changeLanguage(String locale) => _setLocale(locale);

  // Methods

  Future<void> _setLocale(String locale) async {
    // Save the new locale.
    await prefs.setString('locale', locale);

    // Load the new locale.
    currentLocale = locale;
    Intl.defaultLocale = locale;
    await S.load(Locale(locale));

    // Notify listeners.
    emit(LanguageDefined(locale));
  }
}

// State

/// The state of the language.
@immutable
sealed class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

final class LanguageInit extends LanguageState {
  const LanguageInit();
}

final class LanguageDefined extends LanguageState {
  const LanguageDefined(this.locale);

  final String locale;

  @override
  List<Object> get props => [locale];
}
