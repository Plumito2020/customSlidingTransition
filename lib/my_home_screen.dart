import 'package:flutter/material.dart';
import 'package:project/provider/animation.dart';
import 'package:project/widgets/animated_container.dart';
import 'package:provider/provider.dart';

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen>
    with SingleTickerProviderStateMixin {
  ScrollController _controller;

  //
  static const int _itemsNumber = 4;
  static const int margin = 50;
  static const int extent = 240;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            for (var i = 0; i <= _itemsNumber - 1; i++) {
              if (scrollNotification.metrics.extentBefore <= extent * (i + 1) &&
                  scrollNotification.metrics.extentBefore >
                      extent * i - margin) {
                Provider.of<MyAnimations>(context).changeState(i + 1, true);
              } else {
                Provider.of<MyAnimations>(context).changeState(i + 1, false);
              }
            }
            print("Updated");
          }
        },
        child: SingleChildScrollView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              MyAnimatedContainer(Colors.deepPurple, 1),
              MyAnimatedContainer(Colors.deepOrange, 2),
              MyAnimatedContainer(Colors.amber, 3),
              MyAnimatedContainer(Colors.greenAccent, 4),
            ],
          ),
        ),
      ),
    );
  }
}
