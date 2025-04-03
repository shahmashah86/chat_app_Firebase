part of 'profile_bloc.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}
final class ProfileLoaded extends ProfileState {
  final ProfileModel user;
    final String msg;
  ProfileLoaded(this.user,this.msg);

}
final class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
// final class ProfileSaved extends ProfileState {}
