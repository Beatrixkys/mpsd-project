import 'package:flutter/material.dart';
import 'package:mpsd_assignment/constant.dart';
import 'package:mpsd_assignment/pages/service_pages/calculator.dart';
import 'package:mpsd_assignment/pages/home.dart';
import 'package:mpsd_assignment/pages/service_pages/ppv.dart';
import 'package:mpsd_assignment/pages/profile.dart';
import 'package:mpsd_assignment/pages/service_pages/sop.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: const [
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.jpg'),
                        radius: 40.0,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Jennie Kim',
                  style: kButtonTextStyle,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
            ),
            title: const Text(
              'Home',
              style: kButtonTextStyle,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomeScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person_outlined,
            ),
            title: const Text(
              'Profile',
              style: kButtonTextStyle,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Profile();
                  },
                ),
              );
            },
          ),
          /*
          ListTile(
            leading: const Icon(
              Icons.stacked_bar_chart_outlined,
            ),
            title: const Text(
              'Case Updates',
              style: kButtonTextStyle,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomeScreen();
                  },
                ),
              );
            },
          ),
          */
          ListTile(
            leading: const Icon(
              Icons.local_hospital_outlined,
            ),
            title: const Text(
              'PPV Near Me',
              style: kButtonTextStyle,
            ),
            onTap: () {
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
          ListTile(
            leading: const Icon(
              Icons.note_outlined,
            ),
            title: const Text(
              'SOP Updates',
              style: kButtonTextStyle,
            ),
            onTap: () {
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
          /*
          ListTile(
            leading: const Icon(
              Icons.calculate_outlined,
            ),
            title: const Text(
              'Risk Calculator',
              style: kButtonTextStyle,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const RiskCalculator();
                  },
                ),
              );
            },
          ),
          */
        ],
      ),
    );
  }
}
