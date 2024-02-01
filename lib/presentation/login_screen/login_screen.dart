// ignore_for_file: must_be_immutable

import 'package:lsc/widgets/custom_elevated_button.dart';

import 'bloc/login_bloc.dart'
    show LoginBloc, LoginInitialEvent, LoginState, OnClickLoginEvent;
import 'package:flutter/material.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/widgets/custom_floating_button.dart'
    show CustomFloatingButton;
import 'package:lsc/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(LoginState())..add(LoginInitialEvent()),
      child: LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
              key: _formKey,
              child: SizedBox(
                width: 390.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 100.v),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 300.h,
                                height: 100.v,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(ImageConstant.imgImage1),
                                  fit: BoxFit.fill,
                                )),
                              ),
                              SizedBox(height: 71.v),
                              Text(
                                "lbl_login".tr,
                                style: theme.textTheme.titleLarge,
                              ),
                              SizedBox(height: 14.v),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 20.h,
                                  right: 20.h,
                                ),
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset:
                                        Offset(0, 1), // changes position of shadow
                                  ),
                                ], borderRadius: BorderRadius.circular(10)),
                                child: BlocSelector<LoginBloc, LoginState,
                                    TextEditingController?>(
                                  selector: (state) => state.emailController,
                                  builder: (context, emailController) {
                                    return CustomTextFormField(
                                      focusNode: FocusNode(),
                                      autofocus: false,
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
                                            value.toString().trim().isEmpty) {
                                          // if (value == null
                                          // || (!isValidEmail(value,
                                          //     isRequired: true))) {
                                          return "err_msg_please_enter_valid_email"
                                              .tr;
                                        }
                                        return null;
                                      },
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 15.v),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 20.h,
                                  right: 20.h,
                                ),
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset:
                                        Offset(0, 1), // changes position of shadow
                                  ),
                                ], borderRadius: BorderRadius.circular(10)),
                                child: BlocSelector<LoginBloc, LoginState,
                                    TextEditingController?>(
                                  selector: (state) => state.passwordController,
                                  builder: (context, passwordController) {
                                    return CustomTextFormField(
                                      controller: passwordController,
                                      hintText: "lbl_password".tr,
                                      autofocus: false,
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
                                            value.toString().trim().isEmpty) {
                                          // if (value == null ||
                                          //     (!isValidPassword(value,
                                          //         isRequired: true))) {
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // BlocSelector<LoginBloc, LoginState, bool?>(
                                    //   selector: (state) => state.isSelectedSwitch,
                                    //   builder: (context, isSelectedSwitch) {
                                    //     return CustomSwitch(
                                    //       margin: EdgeInsets.only(bottom: 10.v),
                                    //       width: 10.h,
                                    //       height: 5.v,
                                    //       value: isSelectedSwitch,
                                    //       onChange: (value) {
                                    //         context.read<LoginBloc>().add(
                                    //             ChangeSwitchEvent(value: value));
                                    //       },
                                    //     );
                                    //   },
                                    // ),
                                    // Padding(
                                    //   padding: EdgeInsets.only(
                                    //     left: 8.h,
                                    //     bottom: 1.v,
                                    //   ),
                                    //   child: Text(
                                    //     "lbl_remember_me".tr,
                                    //     style: theme.textTheme.bodySmall,
                                    //   ),
                                    // ),
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
                              SizedBox(height: 23.v),
                              CustomElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<LoginBloc>().add(
                                          OnClickLoginEvent(),
                                        );
                                  }
                                  // context.read<LoginBloc>().add(
                                  //       OnClickLoginEvent(),
                                  //     );
                                },
                                text: "lbl_login3".tr.toUpperCase(),
                                buttonStyle: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20.h), // <-- Radius
                                  ),
                                  backgroundColor: appTheme.indigoA700,
                                  textStyle: TextStyle(
                                    fontSize: 16.fSize,
                                  ),
                                  padding: EdgeInsets.all(10.fSize),
                                  elevation: 5,
                                  shadowColor: Colors.grey,
                                ),
                                margin: EdgeInsets.only(
                                  left: 22.h,
                                  right: 16.h,
                                ),
                              ),
                              // Text(
                              //   "lbl_or".tr,
                              //   style: CustomTextStyles.bodyMediumGray900,
                              // ),
                              // SizedBox(height: 12.v),
                              // Text(
                              //   "lbl_log_in_with".tr,
                              //   style: CustomTextStyles.bodySmallGray900,
                              // ),
                              // SizedBox(height: 18.v),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(horizontal: 18.h),
                              //   child: Row(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       CustomIconButton(
                              //         height: 45.adaptSize,
                              //         width: 45.adaptSize,
                              //         padding: EdgeInsets.all(10.h),
                              //         child: CustomImageView(
                              //           imagePath: ImageConstant.imgGoogle1,
                              //         ),
                              //       ),
                              //       Padding(
                              //         padding: EdgeInsets.only(left: 37.h),
                              //         child: CustomIconButton(
                              //           height: 45.adaptSize,
                              //           width: 45.adaptSize,
                              //           padding: EdgeInsets.all(10.h),
                              //           child: CustomImageView(
                              //             imagePath: ImageConstant.imgApple1,
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
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
            // floatingActionButton: _buildFloatingActionButton(context),
          ),
        );
      }
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
