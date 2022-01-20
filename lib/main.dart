import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_flutter_bloc/common/app_string.dart';
import 'package:new_flutter_bloc/pages/counter/counter_page.dart';
import 'package:new_flutter_bloc/pages/form/login_form.dart';
import 'package:new_flutter_bloc/pages/home/home_page.dart';
import 'package:new_flutter_bloc/pages/counter/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return CounterBloc();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppString.homePage,
        routes: {
          AppString.homePage: (context) => const HomePage(),
          AppString.counterPage: (context) => const CounterPage(),
          AppString.loginPage: (context) => const LoginPage(),
        },
      ),
    );
  }
}
