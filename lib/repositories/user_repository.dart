import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notify_me/models/user_model.dart';

abstract class AbstractUserRepository {
  final String collectionName = 'users';

  Future<UserModel> getUser(String userId);

  Future<void> updateUser(UserModel userModel);

  Future<UserModel> addFollowing(String userId, String followingId);
}

class FirebaseUserRepository extends AbstractUserRepository {
  @override
  Future<UserModel> addFollowing(String userId, String followingId) async {
    UserModel model = await getUser(userId);
    model.followings.add(followingId);
    await updateUser(model);
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
