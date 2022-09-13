import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Doc: https://firebase.google.com/docs/auth/flutter/federated-auth#google
class GoogleSignInService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
      // scopes: [
      // 'email',
      // 'https://www.googleapis.com/auth/contacts.readonly',
      // ],
      );

  Future<void> signIn() async {
    _googleSignIn.signOut();
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken);

    UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);
  }

  Future<void> signOut() async => await GoogleSignIn().disconnect();
}
