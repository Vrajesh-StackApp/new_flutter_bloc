import 'package:equatable/equatable.dart';

abstract class LoginFormEvent extends Equatable{
  const LoginFormEvent();

  @override
  List<Object?> get props => [];
}

class EmailChanged extends LoginFormEvent{
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object?> get props => [email];
}

class EmailUnfocused extends LoginFormEvent{}

class PasswordChanged extends LoginFormEvent{
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object?> get props => [password];
}

class PasswordUnfocused extends LoginFormEvent{}

class FormSubmitted extends LoginFormEvent{}