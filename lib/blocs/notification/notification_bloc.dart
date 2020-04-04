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
      yield* handleGetNotifications(event);
    } else if (event is AddFollowing) {
      yield* handleAddFollowing(event);
    } else if (event is GetUserNotifications) {
      yield* handleGetUserNotifications(event);
    } else if (event is SearchNotifications) {
      yield* handleSearchNotifications(event);
    }
  }

  Stream<NotificationState> handleSearchNotifications(
      SearchNotifications event) async* {
    bool _check1 = (event.key != null && event.key.isNotEmpty);
    bool _check = (state is AvailableNotifications &&
        (state as AvailableNotifications).notifications?.length != 0);
    List<NotificationModel> searchedNotifications = [];
    if (event.key.isEmpty) {
      searchedNotifications = lastNotificationList;
    }
    if (_check1 && _check) {
      (state as AvailableNotifications).notifications.forEach((current) {
        if (current.subTitle.toLowerCase().contains(event.key.toLowerCase()) ||
            current.title.toLowerCase().contains(event.key.toLowerCase()) ||
            current.ownerTitle
                .toLowerCase()
                .contains(event.key.toLowerCase())) {
          searchedNotifications.add(current);
        }
      });
    }
    yield AvailableNotifications(searchedNotifications, userNotificationList);
  }

  Stream<NotificationState> handleAddFollowing(AddFollowing event) async* {
    yield Loading();
    UserModel model = await FirebaseUserRepository()
        .addFollowing(event.userId, event.followingId);
    add(GetNotifications(model.followings));
  }

  Stream<NotificationState> handleGetNotifications(
      GetNotifications event) async* {
    if (!(state is AvailableNotifications)) yield Loading();
    lastNotificationList = await notificationCardRepository
        .getNotificationModels(event.followings);
    yield state is AvailableNotifications
        ? (state as AvailableNotifications)
            .copyWith(notificationModels: lastNotificationList)
        : AvailableNotifications(lastNotificationList, userNotificationList);
  }

  Stream<NotificationState> handleGetUserNotifications(
      GetUserNotifications event) async* {
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
