import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable_sandbox/features/detail/detail_controller.dart';
import 'package:rx_notifier/rx_notifier.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final DetailController controller = GetIt.instance.get();

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
                    controller.setTitle('detail');
                  }),
              CupertinoButton(
                  child: Text('Назад'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
