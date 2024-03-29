import 'package:church/UI/home/home.dart';
import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),() async {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
        body: DecoratedBox(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('images/logo.png'),
                fit: BoxFit.fill
            ),
          ),
        ),
    );
  }
}

