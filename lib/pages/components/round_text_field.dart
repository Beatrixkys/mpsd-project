import 'package:flutter/material.dart';
import 'package:mpsd_assignment/constant.dart';

class RoundTextField extends StatelessWidget {
  final String title;

  const RoundTextField({Key? key, required this.title}) : super(key: key);

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
        child: TextField(
          decoration: InputDecoration(
              hintText: title,
              contentPadding: const EdgeInsets.all(15),
              border: InputBorder.none),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
