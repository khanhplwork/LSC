// ignore_for_file: must_be_immutable

part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  ProfileState({
    this.usernameController,
    this.passwordController,
    this.nameController,
    this.lastNameController,
    this.emailController,
    this.phoneController,
    this.vehicleLicensePlateController,
    this.vehicleCodeController,
    this.gender = "Male",
    this.userAvatar,
    this.isActive = false,
    this.isNewsletterSubscriber = false,
    this.noteController,
  });
  TextEditingController? usernameController;
  TextEditingController? passwordController;
  TextEditingController? nameController;
  TextEditingController? lastNameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? vehicleLicensePlateController;
  TextEditingController? vehicleCodeController;
  String gender;
  String? userAvatar;
  bool isActive;
  bool isNewsletterSubscriber;
  TextEditingController? noteController;
  @override
  List<Object?> get props => [
        usernameController,
        passwordController,
        nameController,
        lastNameController,
        emailController,
        phoneController,
        vehicleLicensePlateController,
        gender,
        userAvatar,
        isActive,
        isNewsletterSubscriber,
        noteController,
      ];
  ProfileState copyWith({
    TextEditingController? usernameController,
    TextEditingController? passwordController,
    TextEditingController? nameController,
    TextEditingController? lastNameController,
    TextEditingController? emailController,
    TextEditingController? phoneController,
    TextEditingController? vehicleLicensePlateController,
    TextEditingController? vehicleCodeController,
    String? gender,
    String? userAvatar,
    bool? isActive,
    bool? isNewsletterSubscriber,
    TextEditingController? noteController,
  }) {
    return ProfileState(
      usernameController: usernameController ?? this.usernameController,
      passwordController: passwordController ?? this.passwordController,
      nameController: nameController ?? this.nameController,
      lastNameController: lastNameController ?? this.lastNameController,
      emailController: emailController ?? this.emailController,
      phoneController: phoneController ?? this.phoneController,
      vehicleLicensePlateController:
          vehicleLicensePlateController ?? this.vehicleLicensePlateController,
      vehicleCodeController:
          vehicleCodeController ?? this.vehicleCodeController,
      gender: gender ?? this.gender,
      userAvatar: userAvatar ?? this.userAvatar,
      isActive: isActive ?? this.isActive,
      isNewsletterSubscriber:
          isNewsletterSubscriber ?? this.isNewsletterSubscriber,
      noteController: noteController ?? this.noteController,
    );
  }
}
