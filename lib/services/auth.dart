import 'package:firebase_auth/firebase_auth.dart';
import 'package:mpsd_assignment/models/user.dart';
import 'package:mpsd_assignment/services/database.dart';

class AuthService {
  //create instance of the firebase auth object
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  MyUser? _userFromFirebaseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  Stream<MyUser?> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(String sEmail, String sPassword) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: sEmail, password: sPassword);
      User? user = result.user;

      return _userFromFirebaseUser(user);
    } catch (exception) {
      return exception.toString();
    }
  }

  Future register(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      if (user == null) {
        throw Exception("No user found");
      } else {
        await DatabaseService(user.uid);
      }
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }

  //signout

  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
