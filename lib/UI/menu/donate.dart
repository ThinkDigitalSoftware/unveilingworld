import 'package:flutter/material.dart';

import 'donate_web.dart';
class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> with SingleTickerProviderStateMixin {

  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3));


    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController,
            curve: Curves.fastOutSlowIn));
    delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController,
            curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController,
            curve: Interval(0.7, 1.0, curve: Curves.fastLinearToSlowEaseIn)));

  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(animation: animationController,
    builder: (BuildContext context, Widget child){
    return Scaffold(

      appBar: AppBar(
        title: Text('GIVE'),
        centerTitle: true,
        backgroundColor: Color(0xFF1A237E),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/donate.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Transform(
              transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text('UNVEILING WORLD', style: TextStyle(fontSize: 20, color: Colors.white, height: 2), ),
                    ),
                    Center(
                        child:RichText(
                          text: TextSpan(
                              text: 'GIVE ',
                              children: <TextSpan>[
                                TextSpan(text: 'ONLINE', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                              style: TextStyle(fontSize: 45)
                          ),
                        )),
                  ],
                ),
              ),
            ),

            Transform(
              transform: Matrix4.translationValues(delayedAnimation.value * width, 0.0, 0.0),
              child: Container(
                margin: EdgeInsets.only(top: 30),
                child: Text('Giving is the greatest art of grace', style: TextStyle(fontSize: 25, color: Colors.white),),
              ),
            ),

            Transform(
              transform: Matrix4.translationValues(muchDelayedAnimation.value * width, 0.0, 0.0),
              child: Container(
                margin: EdgeInsets.only(top: 30),
                  child:
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => DonateWeb(),
                          )
                      );
                    },
                    child:  Container(

                      child: Text('GIVE NOW', style: TextStyle(fontSize: 17, color: Colors.white),),
                      decoration: new BoxDecoration(
                        color: Colors.black,
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
                    ),
                  )


              ),
            ),
          ],
        ),

      ),
    );});
  }
  @override
  void dispose(){
    animationController.dispose();

  }
}
