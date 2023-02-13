import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButton(),
            const Spacer(),
            const Text(
              "Settings",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            heading2("Account"),
            const SizedBox(height: 20.0),
            const AccountItem(),
            const SizedBox(height: 25.0),
            heading2("Settings"),
            const SizedBox(height: 20.0),
            SettingsItem(
              title: "Language",
              iconData: Icons.language,
              isSwitch: false,
            ),
            const SizedBox(height: 15.0),
            SettingsItem(
              title: "Notifications",
              iconData: Icons.notifications,
              isSwitch: false,
            ),
            const SizedBox(height: 15.0),
            SettingsItem(
              title: "Dark Mode",
              iconData: Icons.dark_mode,
              isSwitch: true,
            ),
            const SizedBox(height: 15.0),
            SettingsItem(
              title: "Help",
              iconData: Icons.help,
              isSwitch: false,
            ),
            const SizedBox(height: 15.0),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Text heading2(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class AccountItem extends StatelessWidget {
  const AccountItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.grey.shade200,
          child: const Icon(
            Icons.person,
            color: Colors.grey,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(bottom: 5.0),
          child: Text(
            "User Name",
            style: TextStyle(
              color: Colors.black,
              fontSize: 19.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        subtitle: const Text(
          "Personal Info",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
          ),
        ),
        trailing: Container(
          width: 40.0,
          height: 50.0,
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              color: Colors.grey.shade200),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios, size: 15.0),
          ),
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  SettingsItem({
    Key? key,
    required this.title,
    required this.iconData,
    required this.isSwitch,
  }) : super(key: key);

  final bool isSwitch;
  final String title;
  final IconData iconData;
  final colors = [
    Colors.orange,
    Colors.blue,
    Colors.purple,
    Colors.red,
  ];
  final shade100 = [
    Colors.orange.shade100,
    Colors.blue.shade100,
    Colors.purple.shade100,
    Colors.red.shade100,
  ];
  late int colorIndex;

  void _setRandomColor() {
    colorIndex = Random().nextInt(colors.length);
  }

  @override
  Widget build(BuildContext context) {
    _setRandomColor();
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: shade100[colorIndex],
          child: Icon(
            iconData,
            color: colors[colorIndex],
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        trailing: isSwitch
            ? CupertinoSwitch(value: false, onChanged: (_) {})
            : Container(
                width: 40.0,
                height: 50.0,
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.grey.shade200,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios, size: 15.0),
                ),
              ),
      ),
    );
  }
}
