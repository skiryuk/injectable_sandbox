// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:injectable_sandbox/core/storage/local_storage.dart' as _i4;
import 'package:injectable_sandbox/core/storage/shared_preferences_storage.dart'
    as _i5;
import 'package:injectable_sandbox/features/detail/detail_controller.dart'
    as _i6;
import 'package:injectable_sandbox/features/home/home_controller.dart' as _i8;
import 'package:injectable_sandbox/features/home/home_state.dart' as _i3;
import 'package:injectable_sandbox/features/shared_module.dart' as _i9;
import 'package:injectable_sandbox/features/shared_state.dart' as _i7;

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
    gh.lazySingleton<_i4.ILocalStorage>(() => _i5.SharedPreferencesStorage());
    gh.factory<_i6.DetailController>(
        () => _i6.DetailController(gh<_i7.SharedState>()));
    gh.factory<_i8.HomeController>(() => _i8.HomeController(
          gh<_i3.HomeState>(),
          gh<_i7.SharedState>(),
        ));
    return this;
  }

// initializes the registration of shared-scope dependencies inside of GetIt
  _i1.GetIt initSharedScope({_i1.ScopeDisposeFunc? dispose}) {
    return _i2.GetItHelper(this).initScope(
      'shared',
      dispose: dispose,
      init: (_i2.GetItHelper gh) {
        final sharedModule = _$SharedModule();
        gh.lazySingleton<_i7.SharedState>(() => sharedModule.sharedState);
      },
    );
  }
}

class _$SharedModule extends _i9.SharedModule {}
