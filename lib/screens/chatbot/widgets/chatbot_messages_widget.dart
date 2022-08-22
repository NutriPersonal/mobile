import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_colors.dart';
import 'package:nutripersonal/constants/assets_paths.dart';

class ChatbotMessagesWidget extends StatefulWidget {
  ChatbotMessagesWidget({
    Key? key,
    required this.messages,
  }) : super(key: key);

  final List messages;
  final ScrollController _scrollController = ScrollController();

  @override
  State<ChatbotMessagesWidget> createState() => _ChatbotMessagesWidgetState();
}

class _ChatbotMessagesWidgetState extends State<ChatbotMessagesWidget> {
  @override
  Widget build(BuildContext context) {
    widget.messages.add({
      "message": "Olá",
      "isUserMessage": true,
    });

    widget.messages.add({
      "message": "Olá, no que posso te ajudar?",
      "isUserMessage": false,
    });

    var w = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          scale: 0.5,
          image: AssetImage(AppAssets.chatIcon),
        ),
      ),
      child: ListView.separated(
        controller: widget._scrollController,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        itemBuilder: (context, index) {
          var item = widget.messages[index];
          var message = item["message"];
          var isUserMessage = item["isUserMessage"];

          return Row(
            mainAxisAlignment: widget.messages[index]["isUserMessage"]
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                    bottomRight: Radius.circular(
                      isUserMessage ? 0 : 20,
                    ),
                    topLeft: Radius.circular(
                      isUserMessage ? 20 : 0,
                    ),
                  ),
                  color: isUserMessage ? AppColors.primary : AppColors.pDark,
                ),
                constraints: BoxConstraints(maxWidth: w * 2 / 3),
                child: Text(message),
              ),
            ],
          );
        },
        separatorBuilder: (context, itemConter) => const Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        itemCount: widget.messages.length,
      ),
    );
  }
}
