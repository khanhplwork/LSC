// ignore_for_file: must_be_immutable

part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable {}

/// Event that is dispatched when the Splash widget is first created.
class UpdateGroupNewsletterSubscriber extends ProfileEvent {
  UpdateGroupNewsletterSubscriber(this.value);
  bool value;
  @override
  List<Object?> get props => [];
}

class UpdateGroupStatus extends ProfileEvent {
  UpdateGroupStatus(this.value);
  bool value;
  @override
  List<Object?> get props => [];
}

class UpdateGender extends ProfileEvent {
  UpdateGender(this.value);
  String value;
  @override
  List<Object?> get props => [];
}

class ProfileInitialEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class UploadAvatarEvent extends ProfileEvent {
  BuildContext context;
  UploadAvatarEvent(this.context);
  @override
  List<Object?> get props => [];
}

class UpdateProfileEvent extends ProfileEvent {
  BuildContext context;
  UpdateProfileEvent(this.context);
  @override
  List<Object?> get props => [];
}
