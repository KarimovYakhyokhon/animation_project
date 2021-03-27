import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  Animation animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn
    ));
animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;

    return AnimatedBuilder(animation: animationController,
      builder: (BuildContext context, Widget child) {
      return Scaffold(
        body: Transform(
          transform: Matrix4.translationValues(animation.value *width,0.0,0.0 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Login',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(decoration: InputDecoration(
                  hintText: 'Username',
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(decoration: InputDecoration(
                  hintText: 'Username',
                ),),
              ),
              RaisedButton(onPressed: (){},
              elevation: 7.0,
                color: Colors.blueAccent,
                child: Text('Login'),
              ),
              Center(child: Text("Don't have an account?")),
              OutlineButton(onPressed: (){},
              child: Text('Signup'),
              color: Colors.green,
                textColor: Colors.green,
                borderSide: BorderSide(
                  color: Colors.green
                ),
              )
            ],
          )
        ),
      );
      },);
  }
}
