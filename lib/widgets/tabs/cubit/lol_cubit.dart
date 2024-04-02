import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lol_state.dart';

class LolCubit extends Cubit<LolState> {
  LolCubit() : super(LolInitial());
}
