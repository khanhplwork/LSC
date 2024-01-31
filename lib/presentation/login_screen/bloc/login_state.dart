// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

/// Represents the state of Login in the application.
class LoginState extends Equatable {
  LoginState({
    this.emailController,
    this.passwordController,
    this.isSelectedSwitch = false,
  });

  TextEditingController? emailController;

  TextEditingController? passwordController;

  bool isSelectedSwitch;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        isSelectedSwitch,
      ];
      
  LoginState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isSelectedSwitch,
  }) {
    return LoginState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isSelectedSwitch: isSelectedSwitch ?? this.isSelectedSwitch,
    );
  }
}
