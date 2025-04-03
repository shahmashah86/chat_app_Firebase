part of 'profile_bloc.dart';

sealed class ProfileEvent {}
class ProfileSave extends ProfileEvent {
  final ProfileModel profile;
  ProfileSave(this.profile);
}
class Profileget extends ProfileEvent {}
class ProfileUpdate extends ProfileEvent {
  final ProfileModel profile;
  ProfileUpdate(this.profile);
}

