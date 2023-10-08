import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Core_Config/config_constant.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.controller,
    this.hint,
    this.icon,
    this.inputType,
    this.inputAction,
  }) : super(key: key);

  final TextEditingController controller;
  final String? hint;
  final Icon? icon;
  final TextInputType? inputType;
  final TextInputAction? inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[500]!.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoTextField.borderless(
              controller: controller,
              padding: const EdgeInsets.only(
                  left: 65, top: 10, right: 6, bottom: 10),
              prefix: icon,
              placeholder: hint.toString(),
              placeholderStyle: const TextStyle(
                color: ConfigConstant.kBlack,
              ),
              style: const TextStyle(color: ConfigConstant.kWhite),
              textInputAction: inputAction,
              keyboardType: inputType,
            ),
          ],
        ),
      ),
    );
  }
}
