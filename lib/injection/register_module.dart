import 'package:injectable/injectable.dart';
import 'package:injectable_sandbox/features/shared_state.dart';
import 'package:injectable_sandbox/injection/configure_dependencies.dart';

@module
abstract class RegisterModule {
  SharedState get sharedState {
    final currScopeName = getIt.currentScopeName;
    if (!getIt.isRegistered<SharedState>(instanceName: currScopeName)) {
      getIt.registerLazySingleton(() => SharedState(),
          instanceName: currScopeName);
    }
    return getIt.get<SharedState>(instanceName: currScopeName);
  }
}
