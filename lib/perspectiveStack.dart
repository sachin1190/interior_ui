import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'navbar.dart';
import 'designPage.dart';

class PersPectiveStack extends StatefulWidget {
  @override
  _PersPectiveStackState createState() => _PersPectiveStackState();
}

class _PersPectiveStackState extends State<PersPectiveStack>
    with TickerProviderStateMixin {
  Animation perspective;
  AnimationController perspectiveController;

  Animation leftSlide;
  AnimationController leftSlideController;

  Animation leftSlide1;
  AnimationController leftSlideController1;

  Animation leftSlide2;
  AnimationController leftSlideController2;
  bool signUp = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    leftSlideController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    leftSlide = Tween<double>(begin: 00, end: 500).animate(leftSlideController);
    leftSlideController.forward();

    leftSlideController1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    leftSlide1 =
        Tween<double>(begin: 00, end: 500).animate(leftSlideController1);
    leftSlideController1.forward();

    leftSlideController2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    leftSlide2 =
        Tween<double>(begin: 00, end: 500).animate(leftSlideController2);
    leftSlideController2.forward();

    leftSlide2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          signUp = true;
        });
      }
    });

    perspectiveController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    perspective = Tween<double>(begin: -math.pi / 11, end: 0)
        .animate(perspectiveController);

    perspectiveController.forward();
  }

  bool isColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            getNavbar(context),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 800,
              height: 400,
              child: AnimatedBuilder(
                animation: perspective,
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001) // perspective
                      ..rotateY(perspective.value)
                      ..rotateZ(perspective.value * .005),
                    //..rotateX(math.pi / 9),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 500,
                          height: 400,
                          child: Image.asset(
                            'assets/building.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: leftSlide.value,
                          child: Center(
                              child: Transform(
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001) // perspective
                                    ..rotateY(perspective.value),
                                  child: Container(
                                    color:
                                        !isColor ? Colors.grey.shade100 : null,
                                    width: 300,
                                    height: 133,
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Center(
                                          child: Text("About Us"),
                                        ),
                                        Visibility(
                                          visible: !isColor,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0,
                                                bottom: 15.0,
                                                left: 40,
                                                right: 40),
                                            child: RaisedButton(
                                              color: Colors.black87,
                                              onPressed: () {},
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 50.0),
                                                        child: Text(
                                                          'Explore',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))),
                        ),
                        Positioned(
                          top: 133,
                          left: leftSlide1.value,
                          child: Center(
                              child: Transform(
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001) // perspective
                                    ..rotateY(perspective.value),
                                  child: Container(
                                    color:
                                        !isColor ? Colors.grey.shade100 : null,
                                    width: 300,
                                    height: 133,
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Center(
                                          child: Text("Our Designs"),
                                        ),
                                        Visibility(
                                          visible: !isColor,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0,
                                                bottom: 15.0,
                                                left: 40,
                                                right: 40),
                                            child: RaisedButton(
                                              color: Colors.black87,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DeseignPage()));
                                              },
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 50.0),
                                                        child: Text(
                                                          'Explore',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))),
                        ),
                        Positioned(
                          top: 266,
                          left: leftSlide2.value,
                          child: Center(
                              child: Transform(
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001) // perspective
                                    ..rotateY(perspective.value),
                                  child: Container(
                                    color:
                                        !isColor ? Colors.grey.shade100 : null,
                                    width: 300,
                                    height: 133,
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Center(
                                          child: Text("Our Locations"),
                                        ),
                                        Visibility(
                                          visible: !isColor,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0,
                                                bottom: 15.0,
                                                left: 40,
                                                right: 40),
                                            child: RaisedButton(
                                              color: Colors.black87,
                                              onPressed: () {},
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 50.0),
                                                        child: Text(
                                                          'Explore',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Visibility(
              visible: signUp,
              child: Center(
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.black87,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      '           Sign Up         ',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
