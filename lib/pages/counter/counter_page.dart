import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_flutter_bloc/common/app_string.dart';
import 'package:new_flutter_bloc/pages/counter/counter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: _counterBody(),
      ),
    );
  }

  PreferredSizeWidget? _appBar() => AppBar(
        backgroundColor: Colors.blue,
        elevation: 5.0,
        title: Text(AppString.counterPageAppBar),
      );

  Widget? _counterBody() => BlocBuilder<CounterBloc, int>(
      builder: (context, state) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("$state",style: const TextStyle(fontSize: 30),),
                const SizedBox(
                  height: 30,
                ),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      heroTag: "Decrement",
                      onPressed: () {
                        if(state != 0) {
                          BlocProvider.of<CounterBloc>(context).add(CounterDecrementPressed());
                        }
                      },
                      elevation: 5.0,
                      child: const Icon(Icons.remove),
                      backgroundColor: Colors.blue,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    FloatingActionButton(
                      heroTag: "Increment",
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context).add(CounterIncrementPressed());
                      },
                      elevation: 5.0,
                      child: const Icon(Icons.add),
                      backgroundColor: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ));
}
