import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mpsd_assignment/constant.dart';
import 'package:mpsd_assignment/pages/components/menu.dart';
import 'package:url_launcher/url_launcher.dart';

class PPV extends StatefulWidget {
  const PPV({Key? key}) : super(key: key);

  @override
  _PPVState createState() => _PPVState();
}

class _PPVState extends State<PPV> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  //Scroll Variables
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
    mapController.dispose();
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(20),
            height: 178,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),

            //replace with working map soon
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
          ),
          space,
          Expanded(
            child: SizedBox(
              height: 200.0,
              child: ListView(
                children: [
                  Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.location_on_outlined,
                      ),
                      title: const Text(
                        'PPV Dewan Sivik',
                        style: kButtonTextStyle,
                      ),
                      onTap: () {
                        _launchURL(
                            "https://www.google.com/maps/place/Dewan+Sivik+MBPJ/@3.097014,101.6431866,17z/data=!3m1!4b1!4m5!3m4!1s0x31cc4bc41b361ee9:0xaae0de60b9fb58!8m2!3d3.0970769!4d101.6453786");
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.location_on_outlined,
                      ),
                      title: const Text(
                        'PPV University Malaya',
                        style: kButtonTextStyle,
                      ),
                      onTap: () {
                        _launchURL(
                            "https://www.google.com/maps/place/University+of+Malaya/@3.12091,101.6516527,17z/data=!3m1!4b1!4m5!3m4!1s0x31cdb47024217187:0x1e85ebc65d47d641!8m2!3d3.1209046!4d101.6538414");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
