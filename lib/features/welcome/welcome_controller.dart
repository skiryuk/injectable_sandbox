import 'package:injectable/injectable.dart';
import 'package:injectable_sandbox/features/shared_state.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../injection/configure_dependencies.dart';
import 'welcome_state.dart';

@injectable
class WelcomeController {
  final WelcomeState _state;

  final _hasSharedState = RxNotifier<bool?>(null);

  bool? get hasSharedState => _hasSharedState.value;

  WelcomeController(
    this._state,
  );

  void checkHasSharedState() {
    try {
      var sharedState = getIt.get<SharedState>();
      _hasSharedState.value = true;
    } catch (e) {
      _hasSharedState.value = false;
    }
  }
}
