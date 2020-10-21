import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/my_home_screen.dart';
import './provider/animation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return ChangeNotifierProvider.value(
      value: MyAnimations(),
      child: MaterialApp(
        title: 'Custom Sliding Transition',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomeScreen(),
      ),
    );
  }
}
