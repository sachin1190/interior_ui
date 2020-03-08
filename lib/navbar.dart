import 'package:flutter/material.dart';
import 'perspectiveStack.dart';
import 'main.dart';
import 'designPage.dart';

Widget getNavbar(BuildContext context) {
  return Container(
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 700),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            },
            child: Text(
              'Interiors',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 50, left: 25),
          child: InkWell(onTap: () {}, child: Text('Portfolio')),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 50, left: 25),
          child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PersPectiveStack()));
              },
              child: Text('Explore')),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 50, left: 25),
          child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeseignPage()));
              },
              child: Text('Designs')),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 50, left: 25),
          child: InkWell(onTap: () {}, child: Text('About')),
        ),
      ],
    ),
    height: 60,
    width: MediaQuery.of(context).size.width,
    decoration:
        BoxDecoration(border: Border.all(color: Colors.black12, width: 0.6)),
  );
}
