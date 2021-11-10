import 'package:flutter/material.dart';
import 'package:mpsd_assignment/constant.dart';
import 'package:mpsd_assignment/pages/components/menu.dart';
import 'package:mpsd_assignment/services/auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        elevation: 0.0,
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
                radius: 70.0,
              ),
            ),
          ),
          Divider(
            //space between divider inclusive of divider
            height: 10.0,
            color: Colors.grey[800],
          ),
          const Text('NAME', style: kProfTitleTextStyle),
          smallSpace,
          const Text(
            'Jennie Kim',
            style: kProfSubTextStyle,
          ),
          space,
          const Text('STUDENT ID', style: kProfTitleTextStyle),
          smallSpace,
          const Text(
            '0130123',
            style: kProfSubTextStyle,
          ),
          space,
          const Text('EMAIL', style: kProfTitleTextStyle),
          smallSpace,
          const Text(
            '0130123@school.com',
            style: kProfSubTextStyle,
          ),
          space,
          const Text('RISK LEVEL', style: kProfTitleTextStyle),
          smallSpace,
          const Text(
            'Low',
            style: kProfSubTextStyle,
          ),
          space,
          ElevatedButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(
              Icons.edit_outlined,
            ),
            label: const Text(
              'Log Out',
              style: kButtonTextStyle,
            ),
            style: kButtonStyle,
          ),
        ],
      ),
    );
  }
}
