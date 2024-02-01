import 'package:flutter/material.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/presentation/profile_screen/bloc/profile_bloc.dart';
import 'package:lsc/widgets/custom_text_form_filed2.dart';

enum UserStatus { active, inactive }

enum NewsletterSubscriber { yes, no }

class ProfileScreen extends StatefulWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) =>
          ProfileBloc(ProfileState())..add(ProfileInitialEvent()),
      child: ProfileScreen(),
    );
  }

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<String> genderItems = [
    'Male',
    'Female',
    'Other',
  ];

  UserStatus _userStatus = UserStatus.inactive;
  NewsletterSubscriber _newsletterSubscriber = NewsletterSubscriber.no;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 50.v,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text('Profile',
              style: theme.textTheme.headlineLarge!.copyWith(
                color: Colors.black,
                fontSize: 20.v,
                fontWeight: FontWeight.w700,
              )),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black, // Change color here
            size: 20.h, // Change size here
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10.h),
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 100.v,
                    height: 100.v,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?size=338&ext=jpg&ga=GA1.1.1448711260.1706659200&semt=ais",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),

                //username
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.v,
                    left: 10.v,
                    bottom: 10.v,
                  ),
                  child: Text(
                    "Username",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                BlocSelector<ProfileBloc, ProfileState, TextEditingController?>(
                  selector: (state) => state.usernameController,
                  builder: (context, usernameController) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: CustomTextFormField2(
                        focusNode: FocusNode(),
                        autofocus: false,
                        readOnly: true,
                        controller: usernameController,
                        hintText: "lbl_email".tr,
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value == null ||
                              value.toString().trim().isEmpty) {
                            // if (value == null
                            // || (!isValidEmail(value,
                            //     isRequired: true))) {
                            return "Please do not leave this field blank";
                          }
                          return null;
                        },
                      ),
                    );
                  },
                ),

                //Leave this empty unless you change the password
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.v,
                    left: 10.v,
                    bottom: 10.v,
                  ),
                  child: Text(
                    "Leave this empty unless you change the password",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                BlocSelector<ProfileBloc, ProfileState, TextEditingController?>(
                  selector: (state) => state.passwordController,
                  builder: (context, passwordController) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: CustomTextFormField2(
                        focusNode: FocusNode(),
                        autofocus: false,
                        controller: passwordController,
                        hintText: "Password",
                        textInputType: TextInputType.text,
                        // validator: (value) {
                        // if (value == null || value.toString().trim().isEmpty) {
                        //   return "err_msg_please_enter_valid_email".tr;
                        // }
                        // return null;
                        // },
                      ),
                    );
                  },
                ),

                //Name
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.v,
                    left: 10.v,
                    bottom: 10.v,
                  ),
                  child: Text(
                    "Name",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                BlocSelector<ProfileBloc, ProfileState, TextEditingController?>(
                  selector: (state) => state.nameController,
                  builder: (context, nameController) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: CustomTextFormField2(
                        focusNode: FocusNode(),
                        autofocus: false,
                        controller: nameController,
                        hintText: "Name",
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value == null ||
                              value.toString().trim().isEmpty) {
                            return "Please don't leave this field blank.";
                          }
                          return null;
                        },
                      ),
                    );
                  },
                ),

                //Last Name
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.v,
                    left: 10.v,
                    bottom: 10.v,
                  ),
                  child: Text(
                    "Last Name",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                BlocSelector<ProfileBloc, ProfileState, TextEditingController?>(
                  selector: (state) => state.lastNameController,
                  builder: (context, lastNameController) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: CustomTextFormField2(
                        focusNode: FocusNode(),
                        autofocus: false,
                        controller: lastNameController,
                        hintText: "Name",
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value == null ||
                              value.toString().trim().isEmpty) {
                            return "Please don't leave this field blank.";
                          }
                          return null;
                        },
                      ),
                    );
                  },
                ),

                //Email
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.v,
                    left: 10.v,
                    bottom: 10.v,
                  ),
                  child: Text(
                    "Email",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                BlocSelector<ProfileBloc, ProfileState, TextEditingController?>(
                  selector: (state) => state.emailController,
                  builder: (context, emailController) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: CustomTextFormField2(
                        focusNode: FocusNode(),
                        autofocus: false,
                        controller: emailController,
                        hintText: "Email",
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value == null ||
                              value.toString().trim().isEmpty) {
                            return "Please don't leave this field blank.";
                          }
                          return null;
                        },
                      ),
                    );
                  },
                ),

                //Phone
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.v,
                    left: 10.v,
                    bottom: 10.v,
                  ),
                  child: Text(
                    "Phone",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                BlocSelector<ProfileBloc, ProfileState, TextEditingController?>(
                  selector: (state) => state.phoneController,
                  builder: (context, phoneController) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: CustomTextFormField2(
                        focusNode: FocusNode(),
                        autofocus: false,
                        controller: phoneController,
                        hintText: "Phone",
                        textInputType: TextInputType.phone,
                        validator: (value) {
                          if (value == null ||
                              value.toString().trim().isEmpty) {
                            return "Please don't leave this field blank.";
                          }
                          return null;
                        },
                      ),
                    );
                  },
                ),

                //Vehicle License Plate
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.v,
                    left: 10.v,
                    bottom: 10.v,
                  ),
                  child: Text(
                    "Vehicle License Plate",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                BlocSelector<ProfileBloc, ProfileState, TextEditingController?>(
                  selector: (state) => state.vehicleLicensePlateController,
                  builder: (context, vehicleLicensePlateController) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: CustomTextFormField2(
                        focusNode: FocusNode(),
                        autofocus: false,
                        controller: vehicleLicensePlateController,
                        hintText: "Vehicle License Plate",
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value == null ||
                              value.toString().trim().isEmpty) {
                            return "Please don't leave this field blank.";
                          }
                          return null;
                        },
                      ),
                    );
                  },
                ),

                //Vehicle Code
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.v,
                    left: 10.v,
                    bottom: 10.v,
                  ),
                  child: Text(
                    "Vehicle Code",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                BlocSelector<ProfileBloc, ProfileState, TextEditingController?>(
                  selector: (state) => state.vehicleCodeController,
                  builder: (context, vehicleCodeController) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: CustomTextFormField2(
                        focusNode: FocusNode(),
                        autofocus: false,
                        controller: vehicleCodeController,
                        hintText: "Vehicle Code",
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value == null ||
                              value.toString().trim().isEmpty) {
                            return "Please don't leave this field blank.";
                          }
                          return null;
                        },
                      ),
                    );
                  },
                ),

                //Gender
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.v,
                    left: 10.v,
                    bottom: 10.v,
                  ),
                  child: Text(
                    "Gender",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                BlocSelector<ProfileBloc, ProfileState, String>(
                  selector: (state) => state.gender,
                  builder: (context, gender) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: "Select Gender",
                          hintStyle: theme.textTheme.bodyMedium!.copyWith(
                            color: appTheme.gray500,
                          ),
                          contentPadding: EdgeInsets.only(
                            top: 12.v,
                            right: 12.h,
                            bottom: 12.v,
                            left: 12.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.h),
                            borderSide: BorderSide(
                              color: appTheme.gray200,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.h),
                            borderSide: BorderSide(
                              color: appTheme.gray200,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.h),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.4),
                              width: 1,
                            ),
                          ),
                        ),
                        value: gender,
                        onChanged: (newValue) {
                          // Update the selected gender
                          context
                              .read<ProfileBloc>()
                              .add(UpdateGender(newValue!));
                        },
                        items: genderItems
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  },
                ),
                //UserAvatar
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.v,
                    left: 10.v,
                    bottom: 10.v,
                  ),
                  child: Text(
                    "User Avatar",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10.h),
                  padding: EdgeInsets.all(5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.v),
                    border: Border.all(
                      color: appTheme.gray200,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.v),
                              side: BorderSide(color: Colors.black)),
                          backgroundColor: Colors.grey.shade200,
                          textStyle: TextStyle(
                            fontSize: 16.fSize,
                          ),
                          elevation: 2,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.h, vertical: 0.v),
                        ),
                        child: Text(
                          "Choose File",
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.h),
                            child: Text(
                              state.userAvatar ?? "No file chosen",
                              style: theme.textTheme.bodySmall!.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //UserStatus
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.v,
                    left: 10.v,
                    bottom: 10.v,
                  ),
                  child: Text(
                    "User Status",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                BlocSelector<ProfileBloc, ProfileState, bool>(
                  selector: (state) => state.isActive,
                  builder: (context, isActive) {
                    if (isActive) {
                      _userStatus = UserStatus.active;
                    } else {
                      _userStatus = UserStatus.inactive;
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: Row(
                        children: [
                          Radio(
                            value: UserStatus.active,
                            groupValue: _userStatus,
                            activeColor: appTheme.bgEDF5F8,
                            onChanged: (value) {
                              // Set group as active
                              context
                                  .read<ProfileBloc>()
                                  .add(UpdateGroupStatus(true));
                              setState(() {
                                _userStatus = value as UserStatus;
                              });
                            },
                          ),
                          Text("Active"),
                          SizedBox(width: 10.h),
                          Radio(
                            value: UserStatus.inactive,
                            groupValue: _userStatus,
                            activeColor: appTheme.bgEDF5F8,
                            onChanged: (value) {
                              // Set group as inactive
                              context
                                  .read<ProfileBloc>()
                                  .add(UpdateGroupStatus(false));
                              setState(() {
                                _userStatus = value as UserStatus;
                              });
                            },
                          ),
                          Text("Inactive"),
                        ],
                      ),
                    );
                  },
                ),
                //NewsletterSubscriber
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.v,
                    left: 10.v,
                    bottom: 10.v,
                  ),
                  child: Text(
                    "Newsletter Subscriber",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                BlocSelector<ProfileBloc, ProfileState, bool>(
                  selector: (state) => state.isNewsletterSubscriber,
                  builder: (context, isNewslatterSubscriber) {
                    if (isNewslatterSubscriber) {
                      _newsletterSubscriber = NewsletterSubscriber.yes;
                    } else {
                      _newsletterSubscriber = NewsletterSubscriber.no;
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: Row(
                        children: [
                          Radio(
                            value: NewsletterSubscriber.yes,
                            groupValue: _newsletterSubscriber,
                            activeColor: appTheme.bgEDF5F8,
                            onChanged: (value) {
                              // Set group as active
                              context
                                  .read<ProfileBloc>()
                                  .add(UpdateGroupNewsletterSubscriber(true));
                              setState(() {
                                _newsletterSubscriber =
                                    value as NewsletterSubscriber;
                              });
                            },
                          ),
                          Text("Yes"),
                          SizedBox(width: 10.h),
                          Radio(
                            value: NewsletterSubscriber.no,
                            groupValue: _newsletterSubscriber,
                            activeColor: appTheme.bgEDF5F8,
                            onChanged: (value) {
                              // Set group as inactive
                              context
                                  .read<ProfileBloc>()
                                  .add(UpdateGroupNewsletterSubscriber(false));
                              setState(() {
                                _newsletterSubscriber =
                                    value as NewsletterSubscriber;
                              });
                            },
                          ),
                          Text("No"),
                        ],
                      ),
                    );
                  },
                ),

                //Note for internal user only
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.v,
                    left: 10.v,
                    bottom: 10.v,
                  ),
                  child: Text(
                    "Notes for internal use only.",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                BlocSelector<ProfileBloc, ProfileState, TextEditingController?>(
                  selector: (state) => state.noteController,
                  builder: (context, noteController) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: CustomTextFormField2(
                        focusNode: FocusNode(),
                        autofocus: false,
                        controller: noteController,
                        hintText: "",
                        maxLines: 5,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.emailAddress,
                        // validator: (value) {
                        //   if (value == null ||
                        //       value.toString().trim().isEmpty) {
                        //     return "Please don't leave this field blank.";
                        //   }
                        //   return null;
                        // },
                      ),
                    );
                  },
                ),

                SizedBox(
                  height: 100.v,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
