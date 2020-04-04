import 'package:equatable/equatable.dart';
import 'package:notify_me/models/user_model.dart';

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

class UpdateUser extends AuthenticationEvent {
  final UserModel userModel;

  UpdateUser(this.userModel);
  @override
  List<Object> get props => [];
}
