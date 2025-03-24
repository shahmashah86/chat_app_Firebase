part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}
final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}
final class AuthenticationAuthenticated extends AuthenticationState {
  final  UserCredential? userCredential;

  AuthenticationAuthenticated({required this.userCredential});
}
final class AuthenticationFailed extends AuthenticationState {
  final String message;

  AuthenticationFailed(this.message);
}
