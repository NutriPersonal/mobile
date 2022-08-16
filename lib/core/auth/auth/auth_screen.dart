import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutripersonal/constants/assets_paths.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Form(
                  child: SingleChildScrollView(
                    dragStartBehavior: DragStartBehavior.down,
                    clipBehavior: Clip.none,
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage(AppAssets.logotype),
                          width: 250,
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
                              onPressed: loginWithPasswd,
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xff2FC4B2),
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
                                      padding: EdgeInsets.all(10),
                                      primary: Color(0xff8DE5DB),
                                      side: BorderSide(
                                        width: 1,
                                        color: Color(0x99B2F0E8),
                                      ),
                                    ),
                                    label: const Text(
                                      "Entrar com conta do Google",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff8DE5DB),
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
                            _signUpRow(),
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
    const borderColor = Color(0x882FC4B2);
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: borderColor,
        width: 2,
      ),
    );

    return TextFormField(
      autofocus: true,
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

  Widget _signUpRow() {
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
          onTap: goToSignUpPage,
          child: Text(
            "Cadastrar",
            style: textStyle.merge(
              TextStyle(
                color: Color(0xff2FC4B2),
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

  void goToSignUpPage() {
    print("go to sign up page");
  }
}
