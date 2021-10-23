import 'package:flutter/material.dart';
import 'package:mpsd_assignment/constant.dart';
import 'package:mpsd_assignment/pages/service_pages/calculator.dart';
import 'package:mpsd_assignment/pages/components/header.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:mpsd_assignment/pages/components/counter.dart';
import 'package:mpsd_assignment/pages/components/menu.dart';
import 'package:mpsd_assignment/pages/service_pages/ppv.dart';
import 'package:mpsd_assignment/pages/service_pages/sop.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Date Setup
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('dd/MM/yyyy');
  final String formatted = formatter.format(now);

  //DateTime dateToday =
  //    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  //Location SetUp
  Location location = Location();
  bool? serviceEnabled;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

  //Location Functions
  //determine location service and permission available, then find location data
  void locationStatus() async {
    serviceEnabled = await location.serviceEnabled();
    if (serviceEnabled != true) {
      serviceEnabled = await location.requestService();
      if (serviceEnabled != true) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
  }

  //Scroll Variables
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
              image: "assets/images/Drcorona.svg",
              textTop: "Stay Safe,",
              textBottom: "Stay Sane.",
              offset: offset,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: const Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined),
                  const SizedBox(width: 20),
                  Text("$locationData"),
                ],
              ),
            ),
            space,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Case Update\n",
                                  style: kTitleTextstyle,
                                ),
                                TextSpan(
                                  text: "Newest update $formatted ",
                                  style: kSubTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 30,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Counter(
                            color: kInfectedColor,
                            number: 1046,
                            title: "Infected",
                          ),
                          Counter(
                            color: kDeathColor,
                            number: 87,
                            title: "Deaths",
                          ),
                          Counter(
                            color: kRecovercolor,
                            number: 46,
                            title: "Recovered",
                          ),
                        ],
                      ),
                    ),
                    space,
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "PPV Near Me",
                            style: kTitleTextstyle,
                          ),
                          const Spacer(),
                          TextButton(
                            child: const Text("See details"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const PPV();
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(20),
                      height: 178,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),

                      //TODO: replace with working map soon
                      child: Image.asset(
                        "assets/images/map.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    space,
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "SOP Updates",
                                style: kTitleTextstyle,
                              ),
                              const Spacer(),
                              TextButton(
                                child: const Text("See details"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const SOP();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              SymptomCard(
                                image: "assets/images/mask.png",
                                title: "Mask Up",
                                isActive: true,
                              ),
                              SizedBox(width: 10),
                              SymptomCard(
                                image: "assets/images/sanitise.png",
                                title: "Sanitise",
                              ),
                              SizedBox(width: 10),
                              SymptomCard(
                                image: "assets/images/handphone.png",
                                title: "Scan",
                              ),
                              SizedBox(width: 10),
                              SymptomCard(
                                image: "assets/images/temp.png",
                                title: "Measure",
                              ),
                              SizedBox(width: 10),
                              SymptomCard(
                                image: "assets/images/distancing.png",
                                title: "Distance",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    space,
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 200,
                        child: Column(
                          children: [
                            const Text(
                              "What is Your Risk \n to Covid?",
                              style: kTitleTextstyle,
                            ),
                            space,
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      //push the menu page
                                      return const RiskCalculator();
                                    },
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.calculate_outlined,
                              ),
                              label: const Text(
                                'Calculate Covid Risk',
                                style: kButtonTextStyle,
                              ),
                              style: kButtonStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
