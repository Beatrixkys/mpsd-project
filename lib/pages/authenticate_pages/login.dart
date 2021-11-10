//import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:mpsd_assignment/pages/components/animated_image.dart';
import 'package:mpsd_assignment/pages/components/loading.dart';
import 'package:mpsd_assignment/pages/components/round_text_field.dart';
import 'package:mpsd_assignment/services/auth.dart';
//import 'package:provider/src/provider.dart';
import '../../constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showSignIn = true;
  bool loading = false;
  String error = '';

  String email = "";
  String password = "";

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
    // Timplement dispose
    controller.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  void toggleView() {
    setState(() {
      //metre à jour les erreurs dans un formualire
      // en reinitialisant tout le formulaire
      // car on utilise se formulaire dans register et sign in
      _formKey.currentState!.reset();
      error = '';
      emailController.text = '';
      passwordController.text = '';
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final authService = Provider.of<AuthService>(context);

    return loading
        ? const Loading()
        : Container(
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
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        showSignIn ? "Sign In" : "Register",
                        style: kHeadingTextStyle,
                      ),
                    ),
                    space,

                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            RoundTextField(
                              controller: emailController,
                              title: "Email",
                              isPassword: false,
                              onSaved: (String? value) {
                                email != value;
                              },
                            ),
                            smallSpace,
                            RoundTextField(
                              controller: passwordController,
                              title: "Password",
                              isPassword: true,
                              onSaved: (String? value) {
                                password != value;
                              },
                            ),
                          ],
                        )),

                    smallSpace,
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: 300,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() => loading = true);
                                var password = passwordController.value.text;
                                var email = emailController.value.text;

                                // on fit semblant d'appeler firebase pour linstant
                                dynamic result = showSignIn
                                    ? await _auth.signInWithEmailAndPassword(
                                        email, password)
                                    : await _auth.register(email, password);
                                // si l'appelle à firebase echoue alors message derreur
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error = "Please supply a valid email";
                                  });
                                }
                              }
                            },
                            child: Text(
                              showSignIn ? 'Log In' : 'Register',
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
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          smallSpace,
                          ElevatedButton(
                            onPressed: () => toggleView(),
                            child: Text(
                              showSignIn ? 'Register' : 'Sign In',
                              style: kButtonTextStyle,
                            ),
                            style: kButtonStyle,
                          ),
                        ],
                      ),
                    ),

                    space,
                  ],
                ),
              ),
            ),
          );
  }
}
