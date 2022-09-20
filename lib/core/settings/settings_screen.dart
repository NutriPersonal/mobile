import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_constants.dart';
import 'package:nutripersonal/widgets/bottom_drawer/bottom_drawer_widget.dart';
import 'package:nutripersonal/widgets/main_app_bar/main_app_bar_widget.dart';
import 'package:nutripersonal/widgets/main_drawer/main_drawer_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBarWidget(),
      drawer: MainDrawerWidget(
        screenId: AppConstants.settingsScreenId,
      ),
      bottomNavigationBar: const BottomDrawerWidget(
        screenId: AppConstants.settingsScreenId,
      ),
      body: const Text("Settings Screen"),
    );
  }
}
