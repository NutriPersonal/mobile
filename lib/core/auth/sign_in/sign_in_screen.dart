import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutripersonal/constants/app_colors.dart';
import 'package:nutripersonal/constants/app_constants.dart';
import 'package:nutripersonal/constants/assets_paths.dart';
import 'package:nutripersonal/core/auth/sign_up/sign_up_screen.dart';
import 'package:nutripersonal/screens/home/home_screen.dart';
import 'package:nutripersonal/ui/app_dialogs.dart';
import 'package:nutripersonal/utils/services/firebase_auth_service.dart';
import 'package:nutripersonal/utils/services/google_sign_service.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final GoogleSignInService _googleSignInService = GoogleSignInService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    dragStartBehavior: DragStartBehavior.down,
                    clipBehavior: Clip.none,
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 80,
                      bottom: 30,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage(AppAssets.logotype),
                          width: 250,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 60),
                          child: Text(
                            "Fazer login",
                            style: TextStyle(
                              color: AppColors.pDark.withAlpha(200),
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            input("E-mail", Icons.email, _emailController),
                            const SizedBox(height: 20),
                            input(
                                "Senha", Icons.password, _pwdController, true),
                            const SizedBox(height: 35),
                            ElevatedButton(
                              onPressed: () => signInWithPasswd(context),
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.primary,
                                minimumSize: const Size.fromHeight(50),
                              ),
                              child: const Text(
                                "Entrar",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 50),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton.icon(
                                    onPressed: () => signInWithGoogle(context),
                                    label: const Text(
                                      "Entrar com conta do Google",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    icon: SvgPicture.asset(
                                      AppAssets.googleIcon,
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            _signUpRow(context),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget input(String label, IconData icon, TextEditingController controller,
      [bool? obscure]) {
    return TextFormField(
      controller: controller,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: Icon(icon),
      ),
    );
  }

  Widget _signUpRow(BuildContext context) {
    var textStyle = TextStyle(
      color: Colors.grey.shade400,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Não tem conta? ", style: textStyle),
        InkWell(
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () => goToSignUpScreen(context),
          child: Text(
            "Cadastrar",
            style: textStyle.merge(
              const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void signInWithPasswd(BuildContext context) async {
    print("Signning");
    if (_formKey.currentState!.validate()) {
      final authResult = await _firebaseAuthService.signIn(
        _emailController.text,
        _pwdController.text,
      );

      switch (authResult) {
        case 'success':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => HomeScreen()),
          );
          AppDialogs.snackbar(context, 'Bem-vindo(a)!');
          print("success");
          break;
        case 'weak-password':
          AppDialogs.snackbar(context, 'A senha fornecida é fraca.');
          print("A senha fornecida é fraca.");
          break;
        case 'email-already-in-use':
          print("O e-mail já está em uso.");
          AppDialogs.snackbar(context, 'O e-mail já está em uso.');
          break;
        default:
          print(authResult);
          AppDialogs.snackbar(context, authResult);
      }
    } else {
      print("Informações inválidas");
      AppDialogs.snackbar(context, 'Informações inválidas');
    }
  }

  void signInWithGoogle(BuildContext context) async {
    print("sign in with Google");
    _googleSignInService.signIn();
  }

  void goToSignUpScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (builder) => SignUpScreen()),
    );
  }
}
