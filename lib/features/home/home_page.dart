import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable_sandbox/features/home/home_controller.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../detail/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = GetIt.instance.get();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                  onPressed: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (_) => HomePage()));
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
