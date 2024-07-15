import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'shared_state.dart';

final getItShared = GetIt.instance;

@module
abstract class SharedModule {
  @LazySingleton(scope: 'shared')
  SharedState get sharedState => SharedState();
}
