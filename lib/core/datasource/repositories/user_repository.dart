import 'package:tezda_test/core/datasource/services/user_service.dart';
import 'package:tezda_test/core/models/user.dart';

class UserRepository {
  final UserServices _userServices;

  UserRepository(this._userServices);

  // Save User
  Future insertUser(TezdaUser user) {
    return _userServices.insertUpdateUser(user); // save user to Firestore
  }

  Future<void> saveUser(TezdaUser user, {String? oldUserName}) async {
    await _userServices.insertUpdateUser(user,
        update: true, oldUserName: oldUserName); // update user in Firestore
  }
}
