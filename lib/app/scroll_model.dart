import 'package:events/app/constants.dart';
import 'package:flutter/material.dart';

class ScrollModel extends ChangeNotifier {
  final ScrollController _controller = ScrollController();
  ScrollController get controller => _controller;
  final double _flexbarHeight = kAppBarExpandedHeight - kAppBarHeight;

  bool _isFlexbarCollapsed = false;
  bool get isFlexbarCollapsed => _isFlexbarCollapsed;
  set isFlexbarCollapsed(bool collapsed) {
    _isFlexbarCollapsed = collapsed;
    notifyListeners();
  }

  ScrollModel() {
    _controller.addListener(() {
      if (_isFlexbarCollapsed && _controller.offset < _flexbarHeight) {
        isFlexbarCollapsed = false;
      } else if (!_isFlexbarCollapsed && _controller.offset >= _flexbarHeight) {
        isFlexbarCollapsed = true;
      }
    });
  }

  void snapFlexbar() {
    if (_controller.offset > 0 && _controller.offset < _flexbarHeight) {
      final double snapOffset =
          _controller.offset / _flexbarHeight > 0.5 ? _flexbarHeight : 0;

      Future.microtask(() => _animate(snapOffset));
    }
  }

  void toggleFlexbar() {
    !isFlexbarCollapsed ? _animate(_flexbarHeight) : _animate(0);
  }

  void _animate(double snapOffset) {
    _controller.animateTo(
      snapOffset,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }
}
