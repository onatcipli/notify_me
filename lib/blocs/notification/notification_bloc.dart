import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:notify_me/blocs/authentication/bloc.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/models/user_model.dart';
import 'package:notify_me/repositories/notification_card_repository.dart';
import 'package:notify_me/repositories/user_repository.dart';
import './bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final AbstractNotificationCardRepository notificationCardRepository;

  List<NotificationModel> lastNotificationList;
  List<NotificationModel> userNotificationList;
  AuthenticationBloc auth;

  NotificationBloc(this.notificationCardRepository, this.auth);

  @override
  NotificationState get initialState => Loading();

  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    if (event is GetNotifications) {
      if (!(state is AvailableNotifications)) yield Loading();
      lastNotificationList = await notificationCardRepository
          .getNotificationModels(event.followings);
      yield state is AvailableNotifications
          ? (state as AvailableNotifications).copyWith(
              notificationModels: lastNotificationList,
              currentUserNotificationModels: userNotificationList)
          : AvailableNotifications(lastNotificationList, userNotificationList);
    } else if (event is AddFollowing) {
      yield Loading();
      UserModel model = await FirebaseUserRepository()
          .addFollowing(event.userId, event.followingId);
      add(GetNotifications(model.followings));
    } else if (event is GetUserNotifications) {
      yield Loading();
      userNotificationList = await notificationCardRepository
          .getNotificationModels([event.currentUserId]);
      yield state is AvailableNotifications
          ? (state as AvailableNotifications).copyWith(
              notificationModels: lastNotificationList,
              currentUserNotificationModels: userNotificationList)
          : AvailableNotifications(lastNotificationList, userNotificationList);
    }
  }
}
