import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nutripersonal/utils/entities/user_entity.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signOut() async {
    if (_firebaseAuth.currentUser != null) {
      await _firebaseAuth.signOut();
    } else {
      await _googleSignIn.disconnect();
    }
  }

  static UserEntity currentUser() {
    if (FirebaseAuth.instance.currentUser != null) {
      User? currentUser = FirebaseAuth.instance.currentUser;

      return UserEntity(
        id: currentUser?.uid,
        name: currentUser?.displayName,
        email: currentUser?.email,
        photoUrl: currentUser?.photoURL,
        // photoUrl: 'https://s2.glbimg.com/ODHuyW_PWreBSaIHadoMF7UvHFE=/800x0/smart/filters:strsdasdasdaip_icc()/s.glbimg.com/po/tt2/f/original/2014/09/11/mac-os-asdasdlion.png',
      );
    } else {
      GoogleSignInAccount? currentUser = GoogleSignIn().currentUser;

      return UserEntity(
        id: currentUser?.id,
        name: currentUser?.displayName,
        email: currentUser?.email,
        photoUrl: currentUser?.photoUrl,
      );
    }
  }
}
