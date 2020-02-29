import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notify_me/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AbstractAuthenticationRepository {
  final Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();

  final String currentUserKey = 'currentUserKey';

  final String collectionName = 'users';

  UserModel currentUser;

  Future<UserModel> signIn();

  Future<String> signUp();

  Future<UserModel> signInSilently();

  Future<void> setLocalUserId(String userId);

  Future<String> getLocalUserId();

  Future<void> signOut();
}

class LocalAuthenticationRepository extends AbstractAuthenticationRepository {
  @override
  Future<String> getLocalUserId() async {
    final preferences = await sharedPreferences;
    final string = preferences.getString(currentUserKey);
    print(string);
    return string;
  }

  @override
  Future<void> setLocalUserId(String userId) async {
    final preferences = await sharedPreferences;
    final bool string = await preferences.setString(currentUserKey, userId);
    print('is saved ' + string.toString());
    return;
  }

  /// This function creates a new document in Firestore users collection
  /// returning documentID will be save locally as user.id
  @override
  Future<UserModel> signIn() async {
    String userId = await getLocalUserId();
    if (userId == null) {
      userId = await signUp();
    }
    DocumentSnapshot snapshot = await Firestore.instance
        .collection(collectionName)
        .document(userId)
        .get();
    currentUser = UserModel.fromSnapshot(snapshot);
    return currentUser;
  }

  /// Gets the local saved user.id and try to signInSilently.
  @override
  Future<UserModel> signInSilently() {
    // TODO: implement signInSilently
    return null;
  }

  /// This method will delete the local user.id
  @override
  Future<void> signOut() async {
    if (getLocalUserId() != null) {
      final preferences = await sharedPreferences;
      preferences.remove(currentUserKey);
    }
    return;
  }

  /// The method returns and saves the new user.id locally
  @override
  Future<String> signUp() async {
    DocumentReference documentReference =
        Firestore.instance.collection(collectionName).document();
    final userId = documentReference.documentID;
    currentUser = UserModel(id: userId);
    await documentReference.setData(currentUser.toJson());
    setLocalUserId(userId);
    return userId;
  }
}
