import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zoom_widget/zoom_widget.dart';
import 'designPage.dart';
import 'navbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Animation yellowBall;
  AnimationController yellowBallController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    yellowBallController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));

    final Animation curveYellow =
        CurvedAnimation(parent: yellowBallController, curve: Curves.easeInBack);

    yellowBall =
        Tween<double>(begin: 1, end: 1.6).animate(yellowBallController);

    yellowBallController.forward();

    yellowBall.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        yellowBallController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        yellowBallController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            getNavbar(context),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "This is",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Studio By Interior",
                    style: TextStyle(fontSize: 40, decorationThickness: 1),
                  )
                ],
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 400,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80.0, right: 290),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Feel The Style",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "          We create economic spaces",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "with individual design.",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 65, top: 12),
                            child: RaisedButton(
                              onPressed: () {},
                              color: Colors.black87,
                              child: Text(
                                "Get Started",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: 400,
                  child: Row(
                    children: <Widget>[
                      AnimatedBuilder(
                        animation: yellowBall,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: yellowBall.value,
                            child: Image.asset(
                              'assets/sofa.jpg',
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
