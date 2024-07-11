import 'package:flutter/cupertino.dart';
import 'package:injectable_sandbox/features/home/home_controller.dart';
import 'package:injectable_sandbox/injection/configure_dependencies.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../detail/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = getIt.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: RxBuilder(
          builder: (_) => Column(
            children: [
              Text(controller.title ?? '<пусто>'),
              CupertinoButton(
                  child: Text('set title'),
                  onPressed: () {
                    controller.setTitle('home');
                  }),
              CupertinoButton(
                  child: Text('to detail'),
                  onPressed: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (_) => DetailPage()));
                  }),
              CupertinoButton(
                  child: Text('to same home'),
                  onPressed: () async {
                    final scopeName =
                        'homeScope${DateTime.now().microsecondsSinceEpoch}';
                    getIt.pushNewScope(scopeName: scopeName);
                    await Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (_) => HomePage()));
                    getIt.dropScope(scopeName);
                  }),
              CupertinoButton(
                  child: Text('Назад'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
