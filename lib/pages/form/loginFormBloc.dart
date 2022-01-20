import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:new_flutter_bloc/models/form/email.dart';
import 'package:new_flutter_bloc/models/form/password.dart';
import 'package:new_flutter_bloc/pages/form/login_form_event.dart';
import 'package:new_flutter_bloc/pages/form/login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(const LoginFormState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<EmailUnfocused>(_onEmailUnfocused);
    on<PasswordUnfocused>(_onPasswordUnfocused);
    on<FormSubmitted>(_onFormSubmitted);
  }

  @override
  void onTransition(Transition<LoginFormEvent, LoginFormState> transition) {
    debugPrint("onTransition ==> $transition");
    super.onTransition(transition);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginFormState> emit) {
    final email = Email.dirty(event.email);

    emit(state.copyWith(
      email: email.valid ? email : Email.pure(event.email),
      status: Formz.validate([email, state.password]),
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginFormState> emit) {
    final password = Password.dirty(event.password);

    emit(state.copyWith(
      password: password.valid ? password : Password.pure(event.password),
        status: Formz.validate([state.email, password]),
    ));
  }

  void _onEmailUnfocused(EmailUnfocused event, Emitter<LoginFormState> emit) {
    final email = Email.dirty(state.email.value);

    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void _onPasswordUnfocused(PasswordUnfocused event, Emitter<LoginFormState> emit) {
    final password = Password.dirty(state.password.value);

    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  Future<void> _onFormSubmitted(FormSubmitted event, Emitter<LoginFormState> emit) async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    debugPrint("email -> $email");
    debugPrint("password -> $password");

    emit(state.copyWith(
      email: email,
      password: password,
      status: Formz.validate([email, password]),
    ));
    debugPrint("state.status.isValidated 1 -> ${state.status.isValidated}");
    if (state.status.isValidated) {
      debugPrint("state.status.isValidated ==> ${state.status.isValidated}");
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
}
