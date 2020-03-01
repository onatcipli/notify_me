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

  AvailableNotifications(this.notifications);

  AvailableNotifications copyWith(
          {List<NotificationModel> notificationModels}) =>
      new AvailableNotifications(notificationModels ?? notifications);

  @override
  List<Object> get props => [notifications];
}
