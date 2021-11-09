import 'package:flutter/material.dart';
import 'package:mpsd_assignment/constant.dart';
import 'package:mpsd_assignment/pages/components/animated_image.dart';
import 'package:mpsd_assignment/pages/components/round_text_field.dart';
import 'package:mpsd_assignment/services/auth.dart';
import 'package:provider/provider.dart';

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
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<AuthService>(context);

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
                    image1: "assets/images/virus.png",
                    image2: "assets/images/virusfloat.png"),
              ),
              const Center(
                child: Text(
                  "Hi There!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                child: Text(
                  "Let's Stay Safe",
                  style: kHeadingTextStyle,
                ),
              ),
              space,
              RoundTextField(
                title: "Username",
                obscureStatus: false,
                controllerStatus: emailController,
              ),
              smallSpace,
              RoundTextField(
                title: "Password",
                obscureStatus: true,
                controllerStatus: passwordController,
              ),
              smallSpace,
              ElevatedButton(
                onPressed: () {
                  authService.register(
                      emailController.text, passwordController.text);
                },
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
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
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
