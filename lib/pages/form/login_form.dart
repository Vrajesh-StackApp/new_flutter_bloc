import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_flutter_bloc/common/app_string.dart';
import 'package:new_flutter_bloc/pages/form/loginFormBloc.dart';
import 'package:new_flutter_bloc/pages/form/login_form_event.dart';
import 'package:new_flutter_bloc/pages/form/login_form_state.dart';
import 'package:formz/formz.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscureText = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _loginAppBar(),
        body: _loginBody(),
      ),
    );
  }

  PreferredSizeWidget? _loginAppBar() => AppBar(
        title: Text(AppString.loginPageAppBar),
        backgroundColor: Colors.blue,
        elevation: 5.0,
      );

  Widget? _loginBody() => BlocListener<LoginFormBloc, LoginFormState>(
        listener: (context, state) {
          if (state.status.isSubmissionSuccess) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showDialog(context: context, builder: (context) => successDialog());
          }
          if (state.status.isSubmissionInProgress) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(content: Text("Submitting...")));
          }
        },
        child: BlocBuilder<LoginFormBloc, LoginFormState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        initialValue: state.email.value,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                        ],
                        onChanged: (value) => context.read<LoginFormBloc>().add(EmailChanged(email: value)),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          errorText: state.email.invalid ? "Please ensure the email entered is valid" : null,
                          errorMaxLines: 2,
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.person),
                          hintText: "Email",
                          labelText: "Email",
                          isDense: true,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: state.password.value,
                        obscureText: isObscureText,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                        ],
                        onChanged: (value) => context.read<LoginFormBloc>().add(PasswordChanged(password: value)),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          errorText: state.password.invalid ? "Password should be at least 8 characters with at least one letter and number" : null,
                          errorMaxLines: 2,
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: InkWell(
                            onTap: () => setState(() {
                              isObscureText = !isObscureText;
                            }),
                            child: Icon(isObscureText ? Icons.visibility : Icons.visibility_off),
                          ),
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
                          onPressed: () => state.status.isValidated ? context.read<LoginFormBloc>().add(FormSubmitted()) : null,
                          child: const Text("Login"),
                          style: ElevatedButton.styleFrom(elevation: 5.0, padding: const EdgeInsets.symmetric(vertical: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );

  successDialog() => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const <Widget>[
                  Icon(Icons.info),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Form Submitted Successfully!',
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      );
}
