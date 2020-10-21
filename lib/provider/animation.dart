import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';

class MyAnimations with ChangeNotifier {
  Map<String, bool> _animationState = {
    "1": true,
    "2": false,
    "3": false,
    "4": false,
  };

  Map<String, bool> get animationState {
    return {..._animationState};
  }

  void changeState(int index, bool value) {
    _animationState[index.toString()] = value;
    notifyListeners();
  }
}
