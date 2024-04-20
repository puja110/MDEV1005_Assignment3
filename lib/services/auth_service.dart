import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult = await _auth.signInWithCredential(credential);
        return authResult.user;
      }
    } catch (e) {
      print('Error signing in with Google: $e');
    }
    return null;
  }

  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user;
    } catch (e) {
      print('Error registering user: $e');
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user;
    } catch (e) {
      print('Error signing in: $e');
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}