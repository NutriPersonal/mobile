import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nutripersonal/firebase_options.dart';
import 'package:nutripersonal/ui/app_dialogs.dart';

class FirebaseAuthService {
  static Future<FirebaseApp> firebaseApp() async {
    return Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static void listener() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  void signIn() {
    //
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String> signUp(String name, String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user != null ? 'success' : 'error';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'weak-password';
      } else if (e.code == 'email-already-in-use') {
        return 'email-already-in-use';
      } else {
        return 'Erro na comunicação com o Firebase.';
      }
    } catch (e) {
      return e.toString();
    }
  }

  void delete() {
    //
  }
}
