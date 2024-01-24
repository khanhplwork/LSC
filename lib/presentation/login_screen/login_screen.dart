import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/core/utils/validation_functions.dart';
import 'package:lsc/widgets/custom_floating_button.dart';
import 'package:lsc/widgets/custom_icon_button.dart';
import 'package:lsc/widgets/custom_switch.dart';
import 'package:lsc/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(LoginState(
        loginModelObj: LoginModel(),
      ))
        ..add(LoginInitialEvent()),
      child: LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: 307.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 100.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 31.v),
                      padding: EdgeInsets.symmetric(horizontal: 29.h),
                      child: Column(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgImage1,
                            height: 67.v,
                            width: 247.h,
                          ),
                          SizedBox(height: 71.v),
                          Text(
                            "lbl_login".tr,
                            style: theme.textTheme.titleLarge,
                          ),
                          SizedBox(height: 14.v),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 3.h,
                              right: 9.h,
                            ),
                            child: BlocSelector<LoginBloc, LoginState,
                                TextEditingController?>(
                              selector: (state) => state.emailController,
                              builder: (context, emailController) {
                                return CustomTextFormField(
                                  controller: emailController,
                                  hintText: "lbl_email".tr,
                                  textInputType: TextInputType.emailAddress,
                                  prefix: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        12.h, 12.v, 8.h, 13.v),
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgCheckmark,
                                      height: 16.adaptSize,
                                      width: 16.adaptSize,
                                    ),
                                  ),
                                  prefixConstraints: BoxConstraints(
                                    maxHeight: 41.v,
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "err_msg_please_enter_valid_email"
                                          .tr;
                                    }
                                    return null;
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 6.v),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 3.h,
                              right: 9.h,
                            ),
                            child: BlocSelector<LoginBloc, LoginState,
                                TextEditingController?>(
                              selector: (state) => state.passwordController,
                              builder: (context, passwordController) {
                                return CustomTextFormField(
                                  controller: passwordController,
                                  hintText: "lbl_password".tr,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  prefix: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        12.h, 12.v, 6.h, 12.v),
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgLocation,
                                      height: 16.adaptSize,
                                      width: 16.adaptSize,
                                    ),
                                  ),
                                  prefixConstraints: BoxConstraints(
                                    maxHeight: 41.v,
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidPassword(value,
                                            isRequired: true))) {
                                      return "err_msg_please_enter_valid_password"
                                          .tr;
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 14.v),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 13.h,
                              right: 17.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BlocSelector<LoginBloc, LoginState, bool?>(
                                  selector: (state) => state.isSelectedSwitch,
                                  builder: (context, isSelectedSwitch) {
                                    return CustomSwitch(
                                      margin: EdgeInsets.only(bottom: 2.v),
                                      value: isSelectedSwitch,
                                      onChange: (value) {
                                        context.read<LoginBloc>().add(
                                            ChangeSwitchEvent(value: value));
                                      },
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 8.h,
                                    bottom: 1.v,
                                  ),
                                  child: Text(
                                    "lbl_remember_me".tr,
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 28.h,
                                    top: 2.v,
                                  ),
                                  child: Text(
                                    "msg_forgot_password".tr,
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 93.v),
                          Text(
                            "lbl_or".tr,
                            style: CustomTextStyles.bodyMediumGray900,
                          ),
                          SizedBox(height: 12.v),
                          Text(
                            "lbl_log_in_with".tr,
                            style: CustomTextStyles.bodySmallGray900,
                          ),
                          SizedBox(height: 18.v),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.h),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomIconButton(
                                  height: 45.adaptSize,
                                  width: 45.adaptSize,
                                  padding: EdgeInsets.all(10.h),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgGoogle1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 37.h),
                                  child: CustomIconButton(
                                    height: 45.adaptSize,
                                    width: 45.adaptSize,
                                    padding: EdgeInsets.all(10.h),
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgApple1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.v),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "msg_don_t_have_an_account2".tr,
                                  style: CustomTextStyles.bodySmallcc131212,
                                ),
                                TextSpan(
                                  text: "lbl_register_now".tr,
                                  style: CustomTextStyles.bodySmallff1317dd,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: _buildFloatingActionButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context) {
    return CustomFloatingButton(
      height: 45,
      width: 45,
      backgroundColor: appTheme.whiteA700,
      child: CustomImageView(
        imagePath: ImageConstant.imgFacebookAppSymbol,
        height: 22.5.v,
        width: 22.5.h,
      ),
    );
  }
}
