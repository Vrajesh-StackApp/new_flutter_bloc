import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:new_flutter_bloc/models/form/email.dart';
import 'package:new_flutter_bloc/models/form/password.dart';

class LoginFormState extends Equatable with FormzMixin {
  const LoginFormState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final Password password;
  @override
  final FormzStatus status;

  LoginFormState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput> get inputs => [email, password];

  @override
  List<Object?> get props => [email, password, status];
}
