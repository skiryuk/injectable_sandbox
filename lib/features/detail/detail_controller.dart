import 'package:injectable/injectable.dart';
import 'package:injectable_sandbox/features/home_page_count_state.dart';
import 'package:injectable_sandbox/features/shared_state.dart';
import 'package:injectable_sandbox/injection/configure_dependencies.dart';
import 'package:injectable_sandbox/injection/scopes.dart';

@injectable
class DetailController {
  late final SharedState _sharedState;
  final HomePageCountState _homePageCountState;

  DetailController(this._homePageCountState);

  @postConstruct
  void create() {
    _sharedState = getIt.get(
        instanceName: Scopes.homePageIndex(_homePageCountState.count));
  }

  String? get title => _sharedState.title.value;

  void setTitle(String? title) {
    _sharedState.title.value = title;
  }
}
