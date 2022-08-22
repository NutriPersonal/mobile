import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_colors.dart';

class ChatbotUserInputWidget extends StatelessWidget {
  ChatbotUserInputWidget({Key? key, required this.onSendMessage})
      : super(key: key);

  final Function({required String text}) onSendMessage;

  final TextEditingController _userInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
      borderSide: BorderSide(
        color: AppColors.pDarker.withAlpha(50),
        width: 0,
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(
        left: 4,
        right: 4,
        bottom: 4,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: null,
              maxLength: 255,
              controller: _userInputController,
              style: TextStyle(
                color: Colors.white.withAlpha(240),
              ),
              decoration: InputDecoration(
                counterText: "",
                hintText: "Digite sua mensagem...",
                hintStyle: TextStyle(
                  color: Colors.white70.withOpacity(0.7),
                  fontSize: 14,
                ),
                filled: true,
                fillColor: AppColors.pDark,
                border: border,
                errorBorder: border,
                enabledBorder: border,
                focusedBorder: border,
                disabledBorder: border,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: IconButton(
              splashRadius: 26,
              onPressed: () {
                onSendMessage(text: _userInputController.text);
                _userInputController.clear();
              },
              color: AppColors.pLighter,
              icon: const Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
