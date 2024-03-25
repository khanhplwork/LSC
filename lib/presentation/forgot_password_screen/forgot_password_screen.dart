import 'package:flutter/material.dart';
import 'package:lsc/core/api/api.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/widgets/custom_elevated_button.dart';
import 'package:lsc/widgets/custom_text_form_field.dart';
import 'package:lsc/widgets/dialog/fail_dialog.dart';
import 'package:lsc/widgets/dialog/loading_dialog.dart';
import 'package:lsc/widgets/dialog/success_dialog.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ForgotPasswordScreen();
  }

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  Future sendEmail() async {
    showLoadingDialog();
    if (_formKey.currentState!.validate()) {
      var response = await forgotPasswordSendEmail(emailController.text);
      Navigator.of(context).pop();
      if (response["status"] == true) {
        showSuccessDialog(response["message"]);
      } else {
        showFailDialog(response["message"]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: 390.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 80.v),
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
                            )),
                          ),
                          SizedBox(height: 71.v),
                          Text(
                            "Forgot password",
                            style: theme.textTheme.titleLarge,
                          ),
                          SizedBox(height: 5.v),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              "Please enter your email address. You will receive a link to create a new password by email.",
                              style: theme.textTheme.bodySmall,
                            ),
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
                            child: CustomTextFormField(
                              focusNode: FocusNode(),
                              autofocus: false,
                              controller: emailController,
                              hintText: "Email",
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                margin:
                                    EdgeInsets.fromLTRB(12.h, 12.v, 8.h, 13.v),
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
                                  return "err_msg_please_enter_valid_email".tr;
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 23.v),
                          CustomElevatedButton(
                            onPressed: () {
                              sendEmail();
                            },
                            text: "Send Request",
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
                          SizedBox(height: 20.v),
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
}
