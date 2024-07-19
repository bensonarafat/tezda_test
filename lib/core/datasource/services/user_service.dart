import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tezda_test/core/datasource/services/base_service.dart';
import 'package:tezda_test/core/models/user.dart';

class UserServices extends BaseService {
  late final CollectionReference usersRef =
      BaseService.fireStore.collection(BaseService.dbRefUsers);
  final String emailVerified = "emailVerified";
  final String uid = "uid";

// WRITE: Update / Create User
  Future insertUpdateUser(TezdaUser user,
      {bool update = false, String? oldUserName}) async {
    try {
      var batch = BaseService.fireStore.batch();

      var userRef = usersRef.doc(user.uid);
      if (update) {
        batch.update(userRef, user.userToMap());
      } else {
        batch.set(userRef, user.toJson());
      }
      // Add new username
      await batch.commit();
    } catch (_) {
      print("User $_");
    }
  }

  Future<void> updateEmailStatus(User firebaseUser) async {
    // to verified
    await usersRef
        .doc(firebaseUser.uid)
        .update({emailVerified: firebaseUser.emailVerified});
  }

  DocumentReference<TezdaUser> refWithConverter(String userId) {
    // for a specific userId
    return usersRef.doc(userId).withConverter<TezdaUser>(
          fromFirestore: (snapshots, _) =>
              TezdaUser.fromJson(snapshots.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  // READ
  Stream<TezdaUser?> getUserDetailByIdAuth(String id) {
    return refWithConverter(id).snapshots().handleError((error) {
      return Stream<TezdaUser?>.value(null);
    }).map((event) => event.data());
  }
}
