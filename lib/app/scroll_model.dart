import 'package:flutter/material.dart';

class ScrollModel extends ChangeNotifier {
  ScrollController _controller;
  ScrollController get controller => _controller;

  ScrollModel() {
    _controller = ScrollController(); //..addListener(_scrollAnimationListener);
  }

  bool _isAppBarCollapsed = false;
  bool get isAppBarCollapsed => _isAppBarCollapsed;
  set isAppBarCollapsed(bool collapsed) {
    _isAppBarCollapsed = collapsed;
    notifyListeners();
  }

  bool _isAnimating = false;

  // TODO: Scroll, keep scrolling after animation
  void _scrollAnimationListener() {
    if (!_isAnimating) {
      if (_isAppBarCollapsed && _controller.offset < 65) {
        _expandAppBar();
      } else if (!_isAppBarCollapsed && _controller.offset > 0) {
        _collapseAppBar();
      }
    }
  }

  Future _expandAppBar() async {
    _isAnimating = true;
    isAppBarCollapsed = false;
    await _controller.animateTo(
      0,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
    _isAnimating = false;
  }

  Future _collapseAppBar() async {
    _isAnimating = true;
    isAppBarCollapsed = true;
    await _controller.animateTo(
      65,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
    _isAnimating = false;
  }

  void onCalendarButtonPressed() {
    isAppBarCollapsed ? _expandAppBar() : _collapseAppBar();
  }
}
