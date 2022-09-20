import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_constants.dart';
import 'package:nutripersonal/widgets/bottom_drawer/bottom_drawer_widget.dart';
import 'package:nutripersonal/widgets/main_app_bar/main_app_bar_widget.dart';
import 'package:nutripersonal/widgets/main_drawer/main_drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBarWidget(),
      drawer: MainDrawerWidget(
        screenId: AppConstants.homeScreenId,
      ),
      bottomNavigationBar: const BottomDrawerWidget(
        screenId: AppConstants.homeScreenId,
      ),
      body: const Text("Home Screen"),
    );
  }
}
