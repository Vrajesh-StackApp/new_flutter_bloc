import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_flutter_bloc/common/app_string.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscureText = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: _loginAppBar(), body: _loginBody()));
  }

  PreferredSizeWidget? _loginAppBar() => AppBar(
        title: Text(AppString.loginPageAppBar),
        backgroundColor: Colors.blue,
        elevation: 5.0,
      );

  Widget? _loginBody() => Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter email address.";
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    hintText: "Email",
                    labelText: "Email",
                    isDense: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: _isObscureText,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                  onTap: () {
                    _isObscureText =! _isObscureText;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter email address.";
                    }
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(onTap: () => setState(() {
                      _isObscureText = !_isObscureText;
                    }),child: Icon(_isObscureText ? Icons.visibility : Icons.visibility_off)),
                    hintText: "Password",
                    labelText: "Password",
                    isDense: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Login"),
                    style: ElevatedButton.styleFrom(elevation: 5.0,
                    padding: const EdgeInsets.symmetric(vertical: 15)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
