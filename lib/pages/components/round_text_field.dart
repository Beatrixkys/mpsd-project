import 'package:flutter/material.dart';
import 'package:mpsd_assignment/constant.dart';

class RoundTextField extends StatelessWidget {
  final String title;
  final bool isPassword;
  final Function(String?) onSaved;
  final TextEditingController controller;

  const RoundTextField(
      {Key? key,
      required this.controller,
      required this.title,
      required this.isPassword,
      required this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 1, color: kSecondaryColor, style: BorderStyle.solid)),
        child: TextFormField(
          obscureText: isPassword ? true : false,
          decoration: InputDecoration(
              hintText: title,
              contentPadding: const EdgeInsets.all(15),
              border: InputBorder.none),
          onSaved: onSaved,
          controller: controller,
        ),
      ),
    );
  }
}
