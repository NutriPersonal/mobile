import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutripersonal/constants/app_constants.dart';
import 'package:nutripersonal/constants/assets_paths.dart';
import 'package:nutripersonal/core/auth/sign_up/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

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
                            "Fazer login",
                            style: TextStyle(
                              color: AppConstants.dark.withAlpha(200),
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            input("E-mail", Icons.email, _emailController),
                            const SizedBox(height: 20),
                            input("Senha", Icons.password, _pwdController),
                            const SizedBox(height: 35),
                            ElevatedButton(
                              onPressed: loginWithPasswd,
                              style: ElevatedButton.styleFrom(
                                primary: AppConstants.normal,
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
                                    onPressed: loginWithGoogle,
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.all(10),
                                      primary: AppConstants.light,
                                      side: const BorderSide(
                                        width: 1,
                                        color: AppConstants.lighter,
                                      ),
                                    ),
                                    label: const Text(
                                      "Entrar com conta do Google",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppConstants.light,
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
    var borderColor = AppConstants.normal.withAlpha(120);
    var border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: borderColor,
        width: 2,
      ),
    );

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey[600],
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: Icon(icon, color: borderColor),
        iconColor: borderColor,
        fillColor: borderColor,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
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
                color: AppConstants.normal,
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

  void goToSignUpScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (builder) => SignUpScreen()),
    );
  }
}
