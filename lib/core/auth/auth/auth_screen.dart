import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_colors.dart';
import 'package:nutripersonal/constants/app_constants.dart';
import 'package:nutripersonal/constants/assets_paths.dart';
import 'package:nutripersonal/core/auth/sign_in/sign_in_screen.dart';
import 'package:nutripersonal/core/auth/sign_up/sign_up_screen.dart';
import 'package:vrouter/vrouter.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

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
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Image(
                          image: AssetImage(AppAssets.logotype),
                          width: 250,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 60),
                          child: Text(
                            "Olá",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            _buildButton(
                              "Fazer login",
                              () => goToSignInScreen(context),
                            ),
                            const SizedBox(height: 40),
                            _buildButton(
                              "Cadastrar",
                              () => goToSignUpScreen(context),
                              outlined: true,
                            ),
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

  Widget _buildButton(String label, VoidCallback onTap,
      {bool outlined = false}) {
    if (outlined) {
      return OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          primary: AppColors.pLight,
          minimumSize: const Size.fromHeight(50),
          side: const BorderSide(
            width: 1,
            color: AppColors.pLighter,
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.pLight,
          ),
        ),
      );
    }

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: AppColors.primary,
        minimumSize: const Size.fromHeight(50),
      ),
      child: Text(label, style: const TextStyle(fontSize: 16)),
    );
  }

  void goToSignInScreen(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (builder) => SignInScreen()),
    // );
    context.vRouter.to('/sign-in');
  }

  void goToSignUpScreen(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (builder) => SignUpScreen()),
    // );
    context.vRouter.to('/sign-up');
  }
}
