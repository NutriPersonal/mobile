import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutripersonal/constants/app_colors.dart';
import 'package:nutripersonal/constants/assets_paths.dart';
import 'package:nutripersonal/core/auth/sign_in/sign_in_screen.dart';
import 'package:nutripersonal/screens/home/home_screen.dart';
import 'package:nutripersonal/ui/app_dialogs.dart';
import 'package:nutripersonal/utils/app_validators.dart';
import 'package:nutripersonal/utils/services/firebase_auth_service.dart';
import 'package:nutripersonal/utils/services/google_sign_service.dart';
import 'package:vrouter/vrouter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
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
                            "Criar nova conta",
                            style: TextStyle(
                              color: AppColors.primary.withAlpha(120),
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Courgette",
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            input(
                              "Nome",
                              Icons.person,
                              _nameController,
                              AppValidators.name(),
                            ),
                            const SizedBox(height: 20),
                            input(
                              "E-mail",
                              Icons.email,
                              _emailController,
                              AppValidators.email(),
                            ),
                            const SizedBox(height: 20),
                            input(
                              "Senha",
                              Icons.password,
                              _pwdController,
                              AppValidators.password(),
                              true,
                            ),
                            const SizedBox(height: 35),
                            ElevatedButton(
                              onPressed: () => signUpWithPasswd(context),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(50),
                              ),
                              child: const Text(
                                "Cadastrar",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 50),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: OutlinedButton.icon(
                                      onPressed: () => signUpWithGoogle(),
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.all(10),
                                      ),
                                      label: const Text(
                                        "Cadastrar com conta do Google",
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

  Widget input(
    String label,
    IconData icon,
    TextEditingController controller,
    EmailValidator validator, [
    bool? obscure,
  ]) {
    return TextFormField(
      controller: controller,
      validator: validator,
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
        Text("Já tem uma conta? ", style: textStyle),
        InkWell(
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () => goToSignInPage(context),
          child: Text(
            "Entrar",
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

  void signUpWithPasswd(BuildContext context) async {
    print("Signning");
    if (_formKey.currentState!.validate()) {
      final authResult = await _firebaseAuthService.signUp(
        _nameController.text,
        _emailController.text,
        _pwdController.text,
      );

      switch (authResult) {
        case 'success':
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

  void signUpWithGoogle() async {
    print("sign up with Google");
    await _googleSignInService.signIn();
  }

  void goToSignInPage(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (builder) => SignInScreen()),
    // );
    context.vRouter.to('/sign-in');
  }
}
