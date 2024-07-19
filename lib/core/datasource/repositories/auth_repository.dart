import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tezda_test/core/datasource/services/auth.dart';
import 'package:tezda_test/core/datasource/services/user_service.dart';
import 'package:tezda_test/core/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tezda_test/core/utils/shared_preference.dart';

abstract class AuthRepository {
  // Registration & Login
  Future<User?> register(String email, String password);

  Stream<User> authenticate(String email, String password);

  // AutoLogin & Restore Session
  Stream<bool> autoLogin();

  Stream<Result<TezdaUser>> login(String loggedInUserId);

  Stream<TezdaUser?> restoreSession();

  Stream<User?> get firebaseUser;

  // Logout
  Future<bool> signOut();

  Stream<TezdaUser> get currentUser;

  Future sendMail();

  Stream<TezdaUser?> get currentUserNullAble;
}

class AuthRepositoryImpl implements AuthRepository {
  final UserSession _userSession = UserSession();
  final AuthService _authService = AuthService();
  final UserServices _userServices = UserServices();

  final _currentUser = BehaviorSubject<TezdaUser?>.seeded(
      null); // so changes to the TasteBudUser can be observed

  @override
  Stream<TezdaUser> get currentUser => _currentUser.stream.whereNotNull();

  @override
  Stream<TezdaUser?> get currentUserNullAble => _currentUser.stream;

  void setCurrentUser(TezdaUser? user) => _currentUser.add(user);

  AuthRepositoryImpl();

  @override
  Stream<bool> autoLogin() {
    return firebaseUser.asyncMap((currentFirebaseUser) async {
      if (currentFirebaseUser == null) {
        return false;
      }
      TezdaUser? currentUser = await getUser();
      return (currentUser != null && currentUser.uid != null);
    });
  }

  @override
  Stream<User?> get firebaseUser =>
      _authService.currentFirebaseUser().asStream().asyncMap((event) async {
        if (event != null) {
          await _userServices
              .updateEmailStatus(event); // update email status as needed
        }
        return event; // the event is the user in this case
      }).share();

  @override
  Stream<TezdaUser?> restoreSession() {
    return getUser()
        .asStream()
        .whereNotNull()
        .switchMap((TezdaUser currentUser) =>
            _userServices.getUserDetailByIdAuth(currentUser.uid!))
        .asyncMap((TezdaUser? updatedUser) async {
      if (updatedUser != null && updatedUser.uid != null) {
        await _updateToken(updatedUser.uid!);
        listenToUserUpdates(updatedUser.uid!);
      }
      return updatedUser;
    });
  }

  void listenToUserUpdates(String uid) {
    _userServices.getUserDetailByIdAuth(uid).listen((TezdaUser? user) async {
      if (user != null) {
        await _saveUserLocally(user); // local save of the updated user
      }
    });
  }

  Future _saveUserLocally(TezdaUser user) async {
    await _userSession.saveUser(user);
    setCurrentUser(user); // set the current user session
  }

  Future _updateToken(String userId) async {
    await _userSession.token();
  }

  @override
  Future sendMail() {
    return _authService.sendMail(); // verification email
  }

  @override
  Future<bool> signOut() async {
    bool signOut = await _authService.signOut();
    if (signOut) {
      _clearUserOnSignOut();
    }
    return Future.value(true);
  }

  Future<TezdaUser?> getUser() async {
    return await _userSession.getUser();
  }

  _clearUserOnSignOut() async {
    await _userSession.clear();
    setCurrentUser(null);
  }

  @override
  Future<User?> register(String email, String password) =>
      _authService.register(email, password);

  @override
  Stream<Result<TezdaUser>> login(String loggedInUserId) {
    return _userServices
        .getUserDetailByIdAuth(loggedInUserId) // get the user details
        .asyncMap((TezdaUser? user) async {
      // set the local app TasteBudUser object
      if (user == null) {
        return Result.error(Exception("User not found in Firestore"));
      }
      await _updateToken(user.uid!);
      listenToUserUpdates(user.uid!); // listen for any user updates
      return Result.success(user); // return user
    });
  }

  @override
  Stream<User> authenticate(String email, String password) {
    return _authService
        .authenticateWithFireAuth(email, password)
        .asStream()
        .map((UserCredential userCredential) => userCredential.user)
        .whereNotNull()
        .asyncMap((event) async {
      await _userServices.updateEmailStatus(event); // update in db
      return event;
    });
  }
}
