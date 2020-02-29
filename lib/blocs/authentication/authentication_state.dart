import 'package:equatable/equatable.dart';
import 'package:notify_me/models/user_model.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class UnAuthenticated extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthenticationState {
  final UserModel currentUserModel;

  Authenticated(this.currentUserModel);

  @override
  List<Object> get props => [currentUserModel];
}
