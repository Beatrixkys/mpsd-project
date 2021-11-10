import 'package:flutter/material.dart';
import 'package:mpsd_assignment/pages/components/header.dart';
import 'package:mpsd_assignment/constant.dart';
import 'package:mpsd_assignment/pages/components/menu.dart';
import 'package:mpsd_assignment/pages/components/round_text_field.dart';

class RiskCalculator extends StatefulWidget {
  const RiskCalculator({Key? key}) : super(key: key);

  @override
  _RiskCalculatorState createState() => _RiskCalculatorState();
}

class _RiskCalculatorState extends State<RiskCalculator> {
  final txtController = TextEditingController();
  final txtController1 = TextEditingController();
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
    // TODO: implement dispose
    controller.dispose();
    txtController.dispose();
    txtController1.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/images/coronadr.svg",
              textTop: "Risk",
              textBottom: "Calculator",
              offset: offset,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
              child: Column(
                children: [
                  const Text(
                    "Area of Living",
                    style: kTitleTextstyle,
                  ),
                  smallSpace,
                  /*
                  RoundTextField(
                    title: "Name the State",
                    obscureStatus: false,
                    controllerStatus: txtController,
                    savedValue: "live",
                  ),
                  space,
                  const Text(
                    "Indoors or Outdoors?",
                    style: kTitleTextstyle,
                  ),
                  smallSpace,
                  RoundTextField(
                    title: "Select Place",
                    obscureStatus: false,
                    controllerStatus: txtController1,
                    savedValue: "place",
                  ),*/
                  space,
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.done_outlined,
                    ),
                    label: const Text(
                      'Calculate Risk',
                      style: kButtonTextStyle,
                    ),
                    style: kButtonStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
