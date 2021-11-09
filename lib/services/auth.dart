import 'package:firebase_auth/firebase_auth.dart';
import 'package:mpsd_assignment/models/user.dart';

class AuthService {
  //create instance of the firebase auth object
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  MyUser? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return MyUser(uid: user.uid, email: user.email!);
  }

  Stream<MyUser?> get user {
    return _firebaseAuth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user!));
  }

  Future signIn(String sEmail, String sPassword) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: sEmail, password: sPassword);
      User user = result.user!;
      return _userFromFirebase(user);
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }

  Future register(String sEmail, String sPassword) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: sEmail, password: sPassword);
      User user = result.user!;
      return _userFromFirebase(user);
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
