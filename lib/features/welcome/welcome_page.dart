import 'package:flutter/cupertino.dart';
import 'package:injectable_sandbox/features/home/home_page.dart';
import 'package:injectable_sandbox/features/welcome/welcome_controller.dart';
import 'package:injectable_sandbox/injection/configure_dependencies.dart';
import 'package:rx_notifier/rx_notifier.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final WelcomeController controller = getIt.get<WelcomeController>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: RxBuilder(
          builder: (_) => Column(
            children: [
              Text(controller.hasSharedState?.toString() ?? '<пусто>'),
              CupertinoButton(
                  child: Text('to home'),
                  onPressed: () async {
                    await Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (_) => HomePage()));
                  }),
              CupertinoButton(
                  child: Text('check has shared state'),
                  onPressed: () {
                    controller.checkHasSharedState();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
