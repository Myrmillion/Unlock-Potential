import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'toggle_theme_state.dart';

class ToggleThemeCubit extends Cubit<ToggleThemeState> {
  ToggleThemeCubit() : super(ToggleThemeInitial());
}
