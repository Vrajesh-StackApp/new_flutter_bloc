import 'package:flutter/material.dart';
import 'package:new_flutter_bloc/common/app_string.dart';

class StreamTickerPage extends StatefulWidget {
  const StreamTickerPage({Key? key}) : super(key: key);

  @override
  _StreamTickerPageState createState() => _StreamTickerPageState();
}

class _StreamTickerPageState extends State<StreamTickerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _streamAppBar(),
        body: _streamBody(),
        floatingActionButton: _floatingActionButton(),
      ),
    );
  }

  PreferredSizeWidget? _streamAppBar() => AppBar(
    title: Text(AppString.streamPageAppBar),
    backgroundColor: Colors.blue,
    elevation: 5.0,
  );

  Widget? _floatingActionButton() => FloatingActionButton(
    onPressed: () {},
    tooltip: "Start",
    child: const Icon(Icons.timer),
  );

  Widget? _streamBody() => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text("Hello",)
      ],
    ),
  );
}
