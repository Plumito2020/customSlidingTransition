import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';
import '../provider/animation.dart';
import '../widgets/your_item_design.dart';

class MyAnimatedContainer extends StatefulWidget {
  final Color color;
  final int index;

  const MyAnimatedContainer(this.color, this.index);

  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animController;
  static const double angle = math.pi / 2 - 1;

  @override
  void initState() {
    animController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );

    final curvedAnimation = CurvedAnimation(
      parent: animController,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    );

    animation = Tween<double>(
      begin: angle,
      end: 0,
    ).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final animationState = Provider.of<MyAnimations>(context).animationState;
    if (animationState[widget.index.toString()]) {
      animController.forward();
    } else {
      animController.reverse();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset(
          FractionalOffset.center.dx + 0.5, FractionalOffset.center.dy),
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(animation.value),
      child: YourItemDesign(widget.color),
    );
  }
}
