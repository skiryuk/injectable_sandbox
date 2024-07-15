// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:injectable_sandbox/core/storage/local_storage.dart' as _i6;
import 'package:injectable_sandbox/core/storage/shared_preferences_storage.dart'
    as _i7;
import 'package:injectable_sandbox/features/detail/detail_controller.dart'
    as _i8;
import 'package:injectable_sandbox/features/home/home_controller.dart' as _i9;
import 'package:injectable_sandbox/features/home/home_state.dart' as _i3;
import 'package:injectable_sandbox/features/shared_state.dart' as _i5;
import 'package:injectable_sandbox/features/welcome/welcome_controller.dart'
    as _i10;
import 'package:injectable_sandbox/features/welcome/welcome_state.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.HomeState>(() => _i3.HomeState());
    gh.factory<_i4.WelcomeState>(() => _i4.WelcomeState());
    gh.lazySingleton<_i5.SharedState>(() => _i5.SharedState());
    gh.lazySingleton<_i6.ILocalStorage>(() => _i7.SharedPreferencesStorage());
    gh.factory<_i8.DetailController>(
        () => _i8.DetailController(gh<_i5.SharedState>()));
    gh.factory<_i9.HomeController>(() => _i9.HomeController(
          gh<_i3.HomeState>(),
          gh<_i5.SharedState>(),
        ));
    gh.factory<_i10.WelcomeController>(
        () => _i10.WelcomeController(gh<_i4.WelcomeState>()));
    return this;
  }
}
