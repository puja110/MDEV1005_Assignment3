import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// AuthService class provides methods for user authentication
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with Google method
  Future<User?> signInWithGoogle() async {
    try {
      // Attempt to sign in with Google
      final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
      if (googleSignInAccount != null) {
        // Obtain authentication data from Google sign-in
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        // Create authentication credentials
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        // Sign in with the obtained credentials
        final UserCredential authResult = await _auth.signInWithCredential(credential);
        // Return the signed-in user
        return authResult.user;
      }
    } catch (e) {
      // Handle sign-in error
      print('Error signing in with Google: $e');
    }
    // Return null if sign-in fails
    return null;
  }

  // Register with email and password method
  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      // Attempt to register user with email and password
      final UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Return the registered user
      return authResult.user;
    } catch (e) {
      // Handle registration error
      print('Error registering user: $e');
    }
    // Return null if registration fails
    return null;
  }

  // Sign in with email and password method
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      // Attempt to sign in with email and password
      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Return the signed-in user
      return authResult.user;
    } catch (e) {
      // Handle sign-in error
      print('Error signing in: $e');
    }
    // Return null if sign-in fails
    return null;
  }

  // Sign out method
  Future<void> signOut() async {
    // Sign out the current user
    await _auth.signOut();
  }
}