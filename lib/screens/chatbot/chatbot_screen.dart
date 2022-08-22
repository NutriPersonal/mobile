import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_colors.dart';
import 'package:nutripersonal/constants/app_constants.dart';
import 'package:nutripersonal/constants/assets_paths.dart';
import 'package:nutripersonal/screens/chatbot/widgets/chatbot_messages_widget.dart';
import 'package:nutripersonal/screens/chatbot/widgets/chatbot_user_input_widget.dart';
import 'package:nutripersonal/widgets/bottom_drawer/bottom_drawer_widget.dart';
import 'package:nutripersonal/widgets/main_app_bar/main_app_bar_widget.dart';
import 'package:nutripersonal/widgets/main_drawer/main_drawer_widget.dart';

/// Build based on:
/// - https://github.com/akmadan/flutter-dialogflow
/// - https://www.youtube.com/watch?v=GC6VAWi1n14
class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  late DialogFlowtter dialogFlowtter;

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    // DialogFlowtter.fromFile(
    //   path: AppAssets.dialogFlowCredentialsJson,
    // ).then((instance) => dialogFlowtter = instance);

    super.initState();
  }

  void onSendMessage({required String text}) async {
    if (text.isEmpty) {
      print("Message is empty.");
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });
    }

    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(
        text: TextInput(text: text),
      ),
    );

    if (response.message == null) return;

    setState(() {
      addMessage(response.message!);
    });
  }

  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      "message": message,
      "isUserMessage": isUserMessage,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBarWidget(),
      drawer: const MainDrawerWidget(
        screenId: AppConstants.chatBotScreenId,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ChatbotMessagesWidget(
                messages: messages,
              ),
            ),
            ChatbotUserInputWidget(
              onSendMessage: onSendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
