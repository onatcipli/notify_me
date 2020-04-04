import 'package:equatable/equatable.dart';
import 'package:notify_me/models/notification_model.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
}

class Loading extends NotificationState {
  @override
  List<Object> get props => [];
}

class AvailableNotifications extends NotificationState {
  final List<NotificationModel> notifications;
  final List<NotificationModel> currentUserNotifications;

  AvailableNotifications(this.notifications, this.currentUserNotifications);

  AvailableNotifications copyWith(
          {List<NotificationModel> notificationModels,
          List<NotificationModel> currentUserNotificationModels}) =>
      new AvailableNotifications(notificationModels ?? notifications,
          currentUserNotificationModels ?? currentUserNotifications);

  @override
  List<Object> get props => [notifications, currentUserNotifications];
}
