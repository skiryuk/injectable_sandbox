import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable_sandbox/features/home/home_page.dart';

import 'injection/configure_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: HomePage(),
    );
  }
}
