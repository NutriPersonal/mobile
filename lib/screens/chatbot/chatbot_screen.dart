import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_constants.dart';
import 'package:nutripersonal/widgets/bottom_drawer/bottom_drawer_widget.dart';
import 'package:nutripersonal/widgets/main_app_bar/main_app_bar_widget.dart';
import 'package:nutripersonal/widgets/main_drawer/main_drawer_widget.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBarWidget(),
      drawer: MainDrawerWidget(
        screenId: AppConstants.chatBotScreenId,
      ),
      bottomNavigationBar: BottomDrawerWidget(
        screenId: AppConstants.chatBotScreenId,
      ),
      body: Text("ChatBot Screen"),
    );
  }
}
