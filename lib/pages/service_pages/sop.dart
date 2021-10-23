import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mpsd_assignment/constant.dart';
import 'package:mpsd_assignment/pages/components/header.dart';
import 'package:mpsd_assignment/pages/components/menu.dart';

class SOP extends StatefulWidget {
  const SOP({Key? key}) : super(key: key);

  @override
  _SOPState createState() => _SOPState();
}

class _SOPState extends State<SOP> {
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
              image: "assets/images/doctor.svg",
              textTop: "Standard of",
              textBottom: "Procedures",
              offset: offset,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "When Entering Premises",
                    style: kTitleTextstyle,
                  ),
                  space,
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
            ),
            space,
            const Text(
              "Latest News Updates",
              style: kTitleTextstyle,
            ),
            space,

            const PreventCard(
              text:
                  "Interstate travel is now allowed since the vaccination rates are higher and economy needs to run.",
              image: "assets/images/car.png",
              title: "Interstate Travel Allowed",
            ),

            const PreventCard(
              text:
                  "The fully vaccinated population can now dine out, they just have to follow the SOPs",
              image: "assets/images/dining.png",
              title: "Dining Out for Fully Vaccinated",
            ),

            //insert card that diverts to external link
          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 150,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //insert link of sites to navigate to in the future
                      },
                      child: SvgPicture.asset("assets/icons/forward.svg"),
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

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key? key,
    required this.image,
    required this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
