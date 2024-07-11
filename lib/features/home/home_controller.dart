import 'package:injectable/injectable.dart';
import 'package:injectable_sandbox/features/home/home_state.dart';
import 'package:injectable_sandbox/features/home_page_count_state.dart';
import 'package:injectable_sandbox/features/shared_state.dart';
import 'package:injectable_sandbox/injection/configure_dependencies.dart';
import 'package:injectable_sandbox/injection/scopes.dart';

@injectable
class HomeController {
  final HomeState _state;
  final HomePageCountState _homePageCountState;
  late final SharedState _sharedState;

  HomeController(
    this._state,
    this._homePageCountState,
  );

  @postConstruct
  void create() {
    _homePageCountState.count++;
    if (!getIt.isRegistered<SharedState>(
        instanceName: Scopes.homePageIndex(_homePageCountState.count))) {
      getIt.registerLazySingleton(() => SharedState(),
          instanceName: Scopes.homePageIndex(_homePageCountState.count));
    }
    _sharedState = getIt.get<SharedState>(
        instanceName: Scopes.homePageIndex(_homePageCountState.count));
  }

  void dispose() async {
    getIt.unregister<SharedState>(
        instanceName: Scopes.homePageIndex(_homePageCountState.count));
    _homePageCountState.count--;
  }

  String? get title => _sharedState.title.value;

  void setTitle(String? title) {
    _sharedState.title.value = title;
  }
}
