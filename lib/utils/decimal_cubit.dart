import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

// Cubit

/// A cubit to manage the number of decimal displayed for the sensors data.
class DecimalCubit extends Cubit<int> {
  DecimalCubit() : super(8);

  /// Increase the number of decimal.
  void increase() => emit(min(20, state + 1));

  /// Decrease the number of decimal.
  void decrease() => emit(max(1, state - 1));
}
