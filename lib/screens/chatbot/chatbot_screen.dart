import 'package:bubble/bubble.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:nutripersonal/constants/app_constants.dart';
import 'package:nutripersonal/constants/assets_paths.dart';
import 'package:nutripersonal/utils/services/auth_service.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:nutripersonal/widgets/main_app_bar/main_app_bar_widget.dart';
import 'package:nutripersonal/widgets/main_drawer/main_drawer_widget.dart';
import 'package:uuid/uuid.dart';

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
  final List<types.Message> _messages = [];
  final _user = types.User(
    id: AuthService.currentUser().id!,
    imageUrl: AuthService.currentUser().photoUrl,
    firstName: AuthService.currentUser().name,
  );
  final _userBot = types.User(
    id: const Uuid().v4(),
    imageUrl:
        'https://lh3.googleusercontent.com/ogw/AOh-ky3AylhrIkVdMo9Pnurc235eWnFuou8JmsVMxkTC=s32-c-mo',
    firstName: 'NutriPersonal',
  );

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile(
      path: AppAssets.dialogFlowCredentialsJson,
    ).then((instance) => dialogFlowtter = instance);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBarWidget(),
      drawer: MainDrawerWidget(
        screenId: AppConstants.nutritionistsScreenId,
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        showUserAvatars: true,
        showUserNames: true,
        user: _user,
        bubbleBuilder: _bubbleBuilder,
        textMessageBuilder: (p0, {required messageWidth, required showName}) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p0.author.id == _user.id
                      ? _user.firstName!
                      : _userBot.firstName!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB2F0E8),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  p0.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _bubbleBuilder(
    Widget child, {
    required message,
    required nextMessageInGroup,
  }) =>
      Bubble(
        color: const Color(0xff2FC4B2),
        margin: nextMessageInGroup
            ? const BubbleEdges.symmetric(horizontal: 6)
            : null,
        // padding: const BubbleEdges.all(0),
        nip: nextMessageInGroup
            ? BubbleNip.no
            : _user.id != message.author.id
                ? BubbleNip.leftBottom
                : BubbleNip.rightBottom,
        child: child,
        style: const BubbleStyle(
          color: Color(0xff00000),
        ),
      );

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);

    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(
        text: TextInput(text: message.text),
      ),
    );

    if (response.message == null) return;

    final responseMessage = types.TextMessage(
      author: _userBot,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: response.text!,
    );

    _addMessage(responseMessage);
  }
}
