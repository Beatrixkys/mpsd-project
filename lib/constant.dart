import 'package:flutter/material.dart';

//Everything that will not be changed
//colors

const kPrimaryColor = Colors.green;
const kSecondaryColor = Colors.greenAccent;
const kTitleTextColor = Color(0xFF303030);
const kTextLightColor = Color(0xFF959595);
const kTextColor = Colors.black;
const kBackgroundColor = Colors.grey;
final kShadowColor = const Color(0xFFB7B7B7).withOpacity(.16);
final kActiveShadowColor = const Color(0xFFB7B7B7).withOpacity(.5);

//colors for boxes
const kInfectedColor = Color(0xFFFF8748);
const kDeathColor = Color(0xFFFF4848);
const kRecovercolor = Color(0xFF36C12C);

///Text styles
const kHeadingTextStyle = TextStyle(
  fontSize: 35,
  color: kTextColor,
  fontWeight: FontWeight.w600,
);

const kTitleTextstyle = TextStyle(
  fontSize: 25,
  color: kTitleTextColor,
  fontWeight: FontWeight.bold,
  letterSpacing: 2.0,
);

const kSubTextStyle = TextStyle(fontSize: 16, color: kTextLightColor);

const kButtonTextStyle = TextStyle(fontSize: 20, color: kTitleTextColor);

const kProfTitleTextStyle = TextStyle(
  color: kTitleTextColor,
  letterSpacing: 2.0,
);

const kProfSubTextStyle = TextStyle(
  color: kTextColor,
  letterSpacing: 2.0,
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
);

const smallSpace = SizedBox(height: 10);

const space = SizedBox(height: 20);

final kButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(kSecondaryColor),
  padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
  fixedSize: MaterialStateProperty.all(const Size.fromWidth(500)),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40.0),
    ),
  ),
);
