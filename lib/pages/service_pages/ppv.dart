import 'package:flutter/material.dart';
import 'package:mpsd_assignment/constant.dart';
import 'package:mpsd_assignment/pages/components/menu.dart';

class PPV extends StatefulWidget {
  const PPV({Key? key}) : super(key: key);

  @override
  _PPVState createState() => _PPVState();
}

class _PPVState extends State<PPV> {
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
            child: Image.asset(
              "assets/images/map.png",
              fit: BoxFit.contain,
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
                      onTap: () {},
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
                      onTap: () {},
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
