import 'package:injectable/injectable.dart';
import 'package:rx_notifier/rx_notifier.dart';

@lazySingleton
class SharedState {
  final title = RxNotifier<String?>(null);
}
