import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notify_me/models/user_model.dart';
import 'package:notify_me/repositories/cloud_messaging_repository.dart';

abstract class AbstractUserRepository {
  final String collectionName = 'users';

  Future<UserModel> getUser(String userId);

  Future<void> updateUser(UserModel userModel);

  Future<UserModel> addFollowing(String userId, String followingId);
  Future<UserModel> removeFollowing(String userId, String followingId);
}

class FirebaseUserRepository extends AbstractUserRepository {
  @override
  Future<UserModel> addFollowing(String userId, String followingId) async {
    UserModel model = await getUser(userId);
    if (!model.followings.contains(followingId)) {
      model.followings.add(followingId);
      UserModel followingUser = await getUser(followingId);
      followingUser.followerCount = followingUser.followerCount + 1;
      await updateUser(model);
      await updateUser(followingUser);
      CloudMessagingRepository().addFollowing(followingId);
    }
    return model;
  }

  @override
  Future<UserModel> removeFollowing(String userId, String followingId) async {
    UserModel model = await getUser(userId);
    if (model.followings.contains(followingId)) {
      model.followings.remove(followingId);
      UserModel followingUser = await getUser(followingId);
      followingUser.followerCount = followingUser.followerCount - 1;
      await updateUser(model);
      await updateUser(followingUser);
      CloudMessagingRepository().removeFollowing(followingId);
    }
    return model;
  }

  Future<QuerySnapshot> getFollowingUsers(List<String> ids) async {
    var query =
        Firestore.instance.collection(collectionName).where("id", whereIn: ids);
    return await query.getDocuments();
  }

  @override
  Future<UserModel> getUser(String userId) async {
    DocumentReference documentReference =
        Firestore.instance.collection(collectionName).document(userId);
    return UserModel.fromSnapshot(await documentReference.get());
  }

  @override
  Future<void> updateUser(UserModel userModel) async {
    DocumentReference documentReference =
        Firestore.instance.collection(collectionName).document(userModel.id);
    await documentReference.setData(userModel.toJson());
  }
}
