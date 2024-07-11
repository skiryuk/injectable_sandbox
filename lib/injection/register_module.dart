import 'package:injectable/injectable.dart';
import 'package:injectable_sandbox/features/shared_state.dart';
import 'package:injectable_sandbox/injection/configure_dependencies.dart';

@module
abstract class RegisterModule {
  SharedState get sharedState {
    if (!getIt.isRegistered<SharedState>(
        instanceName: getIt.currentScopeName)) {
      getIt.registerLazySingleton(() => SharedState(),
          instanceName: getIt.currentScopeName);
    }
    return getIt.get<SharedState>(instanceName: getIt.currentScopeName);
  }
}
