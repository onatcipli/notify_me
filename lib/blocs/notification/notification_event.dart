import 'package:equatable/equatable.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class SearchNotifications extends NotificationEvent {
  final String key;

  SearchNotifications(this.key);

  @override
  List<Object> get props => [key];
}

class GetNotifications extends NotificationEvent {
  final List<String> followings;

  GetNotifications(this.followings);

  @override
  List<Object> get props => [followings];
}

class GetUserNotifications extends NotificationEvent {
  final String currentUserId;

  GetUserNotifications(this.currentUserId);

  @override
  List<Object> get props => [currentUserId];
}

class AddFollowing extends NotificationEvent {
  final String followingId;
  final String userId;

  AddFollowing(this.followingId, this.userId);

  @override
  List<Object> get props => [followingId, userId];
}
