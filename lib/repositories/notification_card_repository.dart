import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/repositories/cloud_messaging_repository.dart';

abstract class AbstractNotificationCardRepository {
  final String collectionName = 'notifications';

  Future<List<NotificationModel>> getNotificationModels(
      List<String> followings);

  Future<DocumentReference> sendNotification(
    NotificationModel notificationModel,
    String ownerId,
  );
}

class FirebaseNotificationRepository
    extends AbstractNotificationCardRepository {
  @override
  Future<List<NotificationModel>> getNotificationModels(
      List<String> followings) async {
    List<NotificationModel> notificationCards = [];
    //TODO: whereIn can work for querying
    if (followings != null) {
      for (int i = 0; i < followings.length; i++) {
        var querySnapshot = await Firestore.instance
            .collection(collectionName)
            .where(
              'ownerId',
              isEqualTo: followings.elementAt(i),
            )
            .getDocuments();
        if (querySnapshot != null && querySnapshot.documents.isNotEmpty) {
          for (DocumentSnapshot snapshot in querySnapshot.documents) {
            notificationCards.add(NotificationModel.fromSnapshot(snapshot));
          }
        }
      }
    }
    return notificationCards;
  }

  @override
  Future<DocumentReference> sendNotification(
    NotificationModel notificationModel,
    String ownerId,
  ) async {
    DocumentReference documentReference =
        Firestore.instance.collection(collectionName).document();
    notificationModel.id = documentReference.documentID;
    notificationModel.ownerId = ownerId;
    await documentReference.setData(notificationModel.toJson());
    await CloudMessagingRepository().pushNotification(
      model: notificationModel,
      ownerId: ownerId,
    );
    return documentReference;
  }
}
