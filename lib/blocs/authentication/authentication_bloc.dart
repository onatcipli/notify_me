import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:notify_me/models/user_model.dart';
import 'package:notify_me/repositories/authentication_repository.dart';
import './bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AbstractAuthenticationRepository authenticationRepository;

  AuthenticationBloc(this.authenticationRepository);

  @override
  AuthenticationState get initialState => UnAuthenticated();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      add(Authenticate());
    }
    if (event is Authenticate) {
      UserModel currentUser = await authenticationRepository.signIn();
      yield Authenticated(currentUser);
    }
    if (event is UnAuthenticate) {
      authenticationRepository.signOut();
      yield UnAuthenticated();
    }
  }
}
