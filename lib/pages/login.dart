import 'package:flutter/material.dart';
import 'package:mpsd_assignment/pages/components/animated_image.dart';
import 'package:mpsd_assignment/pages/components/round_text_field.dart';

import '../constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = ScrollController();
  double offset = 0;

  //Scroll Function
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(145, 131, 222, 1),
          Color.fromRGBO(160, 148, 227, 1),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              space,
              const SizedBox(
                  width: double.infinity,
                  child: AnimatedImage(
                    image1: "assets/images/virus.png",
                    image2: "assets/images/virusfloat.png",
                  )),
              const Center(
                child: Text(
                  "Hi There!",
                  style: kSubTextStyle,
                ),
              ),
              const SizedBox(
                child: Text(
                  "Let's Log In",
                  style: kHeadingTextStyle,
                ),
              ),
              space,
              const RoundTextField(title: "Username"),
              smallSpace,
              const RoundTextField(title: "Password"),
              smallSpace,
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Log In',
                  style: kButtonTextStyle,
                ),
                style: kButtonStyle,
              ),
              const Divider(
                height: 20.0,
              ),
              const Center(
                child: Text(
                  "Don't Have An Account?",
                  style: kSubTextStyle,
                ),
              ),
              smallSpace,
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Register',
                  style: kButtonTextStyle,
                ),
                style: kButtonStyle,
              ),
              space,
            ],
          ),
        ),
      ),
    );
  }
}
