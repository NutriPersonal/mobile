import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutripersonal/constants/assets_paths.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage(AppAssets.logotype),
                        width: 320,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 60),
                        child: Text(
                          "Fazer login",
                          style: TextStyle(
                            color: Color(0x88289c8e),
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
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                            ),
                            onPressed: loginWithPasswd,
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
                                    padding: EdgeInsets.all(10),
                                  ),
                                  label: const Text(
                                    "Entrar com conta do Google",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  icon: SvgPicture.asset(
                                    AppAssets.googleIcon,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Não tem conta? "),
                              InkWell(
                                highlightColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: goToSignUpPage,
                                child: Text("Cadastrar"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
    const borderColor = Color(0x882FC4B2);
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
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

  void loginWithPasswd() {
    print("login with password");
  }

  void loginWithGoogle() {
    print("login with Google");
  }

  void goToSignUpPage() {
    print("go to sign up page");
  }
}
