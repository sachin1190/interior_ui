import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navbar.dart';

class DeseignPage extends StatefulWidget {
  @override
  _DeseignPageState createState() => _DeseignPageState();
}

class _DeseignPageState extends State<DeseignPage>
    with TickerProviderStateMixin {
  int selVal = 0;
  Animation clipAnimation;
  AnimationController clipAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    clipAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    Animation clipCurve =
        CurvedAnimation(parent: clipAnimationController, curve: Curves.easeIn);

    clipAnimation = Tween<double>(begin: 1, end: .85).animate(clipCurve);
    clipAnimationController.forward();

    clipAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        clipAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        clipAnimationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          getNavbar(context),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Text(
                'Choose your interrior design',
                style: TextStyle(fontSize: 45, color: Colors.black87),
              ),
            ),
          ),
          CupertinoSlidingSegmentedControl(
            children: getWids(),
            groupValue: selVal,
            onValueChanged: (val) {
              setState(() {
                selVal = val;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Center(
              child: AnimatedBuilder(
                  animation: clipAnimation,
                  builder: (context, child) {
                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        widthFactor: clipAnimation.value,
                        heightFactor: clipAnimation.value,
                        child: Container(
                          width: 600,
                          height: 400,
                          child: Image.asset('assets/minimalist$selVal.jpg'),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

Map<int, Widget> getWids() {
  return {
    0: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Text(
        'Minimalist',
        style: TextStyle(fontSize: 15, color: Colors.black87),
      ),
    ),
    1: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Text(
        "Contemporary",
        style: TextStyle(fontSize: 15, color: Colors.black87),
      ),
    ),
    2: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Text(
        "Traditional",
        style: TextStyle(fontSize: 15, color: Colors.black87),
      ),
    ),
    3: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Text(
        "Transitional",
        style: TextStyle(fontSize: 15, color: Colors.black87),
      ),
    ),
  };
}
