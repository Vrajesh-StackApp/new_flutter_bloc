import 'package:flutter/material.dart';
import 'package:new_flutter_bloc/common/app_string.dart';
import 'package:new_flutter_bloc/pages/counter/counter_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: _homeBody(),
      ),
    );
  }

  PreferredSizeWidget? _appBar() => AppBar(
        title: Text(AppString.homePageAppBar),
        backgroundColor: Colors.blue,
        elevation: 5.0,
      );


  Widget? _homeBody() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppString.counterPage);
              },
              child: Text(AppString.counter),
              style: ElevatedButton.styleFrom(
                elevation: 5.0,
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppString.loginPage);
              },
              child: Text(AppString.login),
              style: ElevatedButton.styleFrom(
                elevation: 5.0,
              ),
            ),
          ],
        ),
      );
}
