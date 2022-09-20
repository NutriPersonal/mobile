import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nutripersonal/firebase_options.dart';

class FirebaseAuthService {
  static Future<FirebaseApp> firebaseApp() async {
    return Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<String> signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return credential.user != null ? 'success' : 'error';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Usuário não encontrado';
      } else if (e.code == 'wrong-password') {
        return 'Senha incorreta.';
      } else {
        return e.toString();
      }
    } catch (e) {
      return e.toString();
    }
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
}
