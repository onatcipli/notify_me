import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {

  @override
  List<Object> get props => [];
}

class Authenticate extends AuthenticationEvent {

  @override
  List<Object> get props => [];
}

class UnAuthenticate extends AuthenticationEvent {

  @override
  List<Object> get props => [];
}

class GetUpdatedUser extends AuthenticationEvent {

  @override
  List<Object> get props => [];
}
