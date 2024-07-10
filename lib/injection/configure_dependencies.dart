import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:injectable_sandbox/injection/configure_dependencies.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() async => getIt.init();
