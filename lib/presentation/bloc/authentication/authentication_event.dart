part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}
final class AuthenticationByGoogle extends AuthenticationEvent {}
final class AuthernticationSignOut extends AuthenticationEvent {}

