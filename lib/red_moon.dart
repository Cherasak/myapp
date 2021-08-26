import 'package:abctest/Event_info.dart';
import 'package:abctest/place_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerReadMoon extends StatelessWidget {
  DrawerReadMoon({Key? key}) : super(key: key);

  void toToRoute(context, Widget route) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => route,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Text(
              "เมนู",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
              leading: Icon(Icons.ac_unit_sharp),
              title: Text("ประเพณี"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventInfo(),
                  ),
                );
              }
              // toToRoute(context, ),
              ),
          ListTile(
            leading: Icon(Icons.access_alarm_outlined),
            title: Text("สถานที่ท่องเที่ยว"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("ที่พัก"),
          ),
          ListTile(leading: Icon(Icons.article), title: Text("ออกจากระบบ"))
        ],
      ),
    );
  }
}
