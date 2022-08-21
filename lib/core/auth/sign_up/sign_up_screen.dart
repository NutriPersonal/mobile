import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutripersonal/constants/app_colors.dart';
import 'package:nutripersonal/constants/app_constants.dart';
import 'package:nutripersonal/constants/assets_paths.dart';
import 'package:nutripersonal/core/auth/sign_in/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Form(
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
                            input("Nome", Icons.person, _emailController),
                            const SizedBox(height: 20),
                            input("E-mail", Icons.email, _emailController),
                            const SizedBox(height: 20),
                            input("Senha", Icons.password, _pwdController),
                            const SizedBox(height: 35),
                            ElevatedButton(
                              onPressed: loginWithPasswd,
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
                                  OutlinedButton.icon(
                                    onPressed: loginWithGoogle,
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.all(10),
                                    ),
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

  Widget input(String label, IconData icon, TextEditingController controller) {
    return TextFormField(
      controller: controller,
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

  void loginWithPasswd() {
    print("login with password");
  }

  void loginWithGoogle() {
    print("login with Google");
  }

  void goToSignInPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (builder) => SignInScreen()),
    );
  }
}
