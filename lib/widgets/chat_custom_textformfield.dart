import 'package:flutter/material.dart';
import '../resources/job_colors.dart';

class ChatCustomTextFormField extends StatefulWidget {
  const ChatCustomTextFormField({Key? key}) : super(key: key);

  @override
  State<ChatCustomTextFormField> createState() => _ChatCustomTextFormFieldState();
}

class _ChatCustomTextFormFieldState extends State<ChatCustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 30),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: JobColors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 5,
                      color: JobColors.lightText)
                ]),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.face, color: JobColors.blue),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: "type something...",
                        helperStyle: TextStyle(color: JobColors.lightText),
                        border: InputBorder.none),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.photo_camera, color: JobColors.blue),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.attach_file, color: JobColors.blue),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        Container(
          padding: const EdgeInsets.all(10),
          decoration:
          const BoxDecoration(color: JobColors.lightText, shape: BoxShape.circle),
          child: InkWell(
            child: const Icon(Icons.keyboard_voice, color: JobColors.white),
            onLongPress: () {},
          ),
        )
      ],
    );
  }
}
