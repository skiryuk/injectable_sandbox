import 'package:injectable/injectable.dart';
import 'package:injectable_sandbox/features/home/home_state.dart';
import 'package:injectable_sandbox/features/shared_state.dart';

@injectable
class HomeController {
  final HomeState _state;
  final SharedState _sharedState;

  HomeController(this._state, this._sharedState);

  String? get title => _sharedState.title.value;

  void setTitle(String? title) {
    _sharedState.title.value = title;
  }
}
