part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();
  
  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}
final class AuthenticationSuccess extends AuthenticationState {
 final MyUser user;
  AuthenticationSuccess({required this.user});
}
final class  Authenticationfailure extends AuthenticationState {
    final String errmessage;
  Authenticationfailure({required this.errmessage});
}
final class Authenticationloading extends AuthenticationState {}
