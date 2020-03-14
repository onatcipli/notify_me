import 'package:equatable/equatable.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class GetNotifications extends NotificationEvent {
  final List<String> followings;

  GetNotifications(this.followings);

  @override
  List<Object> get props => [followings];
}