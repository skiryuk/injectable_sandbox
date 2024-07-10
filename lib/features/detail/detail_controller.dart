import 'package:injectable/injectable.dart';
import 'package:injectable_sandbox/features/shared_state.dart';

@injectable
class DetailController {
  final SharedState _sharedState;

  DetailController(this._sharedState);

  String? get title => _sharedState.title.value;

  void setTitle(String? title) {
    _sharedState.title.value = title;
  }
}
