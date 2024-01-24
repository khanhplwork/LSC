// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

/// Represents the state of Login in the application.
class LoginState extends Equatable {
  LoginState({
    this.emailController,
    this.passwordController,
    this.isSelectedSwitch = false,
    this.loginModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? passwordController;

  LoginModel? loginModelObj;

  bool isSelectedSwitch;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        isSelectedSwitch,
        loginModelObj,
      ];
  LoginState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isSelectedSwitch,
    LoginModel? loginModelObj,
  }) {
    return LoginState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isSelectedSwitch: isSelectedSwitch ?? this.isSelectedSwitch,
      loginModelObj: loginModelObj ?? this.loginModelObj,
    );
  }
}
