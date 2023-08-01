import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/players_controller.dart';
import '../../utils/app_styles.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  String? playerName;
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<PlayersController>(context);
    return AlertDialog(
      title: Text(
        'أضف اسم اللاعب',
        style: AppStyles.defaultTextStyle,
        textAlign: TextAlign.center,
      ),
      content: TextField(
        decoration: InputDecoration(
          enabledBorder: customBorder(),
          focusedBorder: customBorder(),
        ),
        onChanged: (value) {
          playerName = value;
        },
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'إلغاء',
              style: AppStyles.defaultTextStyle,
            )),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {
              if (playerName != null) {
                controller.addNameToList(name: playerName!);
                Navigator.pop(context);
              }
            },
            child: Text(
              'إضافة',
              style: AppStyles.defaultTextStyle,
            ))
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }

  OutlineInputBorder customBorder() => const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      );
}
