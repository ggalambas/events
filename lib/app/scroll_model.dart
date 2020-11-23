import 'package:flutter/material.dart';

class ScrollModel extends ChangeNotifier {
  ScrollController controller;
  bool _animating = false;

  Future _autoCollapse() async {
    // TODO: Scroll, keep scrolling after animation
    // controller.position
    if (!_animating) {
      if (_isAppBarCollapsed && controller.offset < 64) {
        _animating = true;
        isAppBarCollapsed = false;
        await controller.animateTo(
          0,
          duration: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
        );
        _animating = false;
      } else if (!_isAppBarCollapsed && controller.offset > 0) {
        _animating = true;
        isAppBarCollapsed = true;
        await controller.animateTo(
          64,
          duration: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
        );
        _animating = false;
      }
    }
  }

  ScrollModel() {
    controller = ScrollController()..addListener(_autoCollapse);
  }

  bool _isAppBarCollapsed = false;
  bool get isAppBarCollapsed => _isAppBarCollapsed;
  set isAppBarCollapsed(bool collapsed) {
    _isAppBarCollapsed = collapsed;
    notifyListeners();
  }

  void onPressed() {
    //TODO
  }
}
