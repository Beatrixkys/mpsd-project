import 'package:flutter/material.dart';
import 'package:mpsd_assignment/constant.dart';
import 'package:mpsd_assignment/pages/components/animated_image.dart';
import 'package:mpsd_assignment/pages/components/round_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final controller = ScrollController();
  double offset = 0;

  //Scroll Function
  @override
  void initState() {
    // implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // implement dispose
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
              const SizedBox(
                width: double.infinity,
                child: AnimatedImage(
                    image1: "assets/images/clouds.png",
                    image2: "assets/images/bird2.png"),
              ),
              const Center(
                child: Text(
                  "Hi There!",
                  style: kSubTextStyle,
                ),
              ),
              const SizedBox(
                child: Text(
                  "Let's Soar Together",
                  style: kHeadingTextStyle,
                ),
              ),
              space,
              const RoundTextField(
                title: "Username",
                obscureStatus: false,
              ),
              smallSpace,
              const RoundTextField(
                title: "Password",
                obscureStatus: true,
              ),
              smallSpace,
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Create an Account',
                  style: kButtonTextStyle,
                ),
                style: kButtonStyle,
              ),
              const Divider(
                height: 20.0,
              ),
              const Center(
                child: Text(
                  "Already Have An Account?",
                  style: kSubTextStyle,
                ),
              ),
              smallSpace,
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Log In',
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
