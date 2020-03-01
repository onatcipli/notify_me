import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/repositories/notification_card_repository.dart';
import './bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final AbstractNotificationCardRepository notificationCardRepository;

  List<NotificationModel> lastNotificationList;

  NotificationBloc(this.notificationCardRepository);

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
          ? (state as AvailableNotifications)
              .copyWith(notificationModels: lastNotificationList)
          : AvailableNotifications(lastNotificationList);
    }
  }
}
