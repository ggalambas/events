import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class ScrollModel extends ChangeNotifier {
  final ScrollController _controller = ScrollController();
  ScrollController get controller => _controller;
  final double _flexbarHeight = kAppBarExpandedHeight - kToolbarHeight;

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
      _controller.offset / _flexbarHeight > 0.5
          ? collapseFlexBar()
          : expandFlexBar();
    }
  }

  void toggleFlexbar() {
    !isFlexbarCollapsed ? collapseFlexBar() : expandFlexBar();
  }

  void collapseFlexBar() {
    Future.microtask(() => _animate(_flexbarHeight));
  }

  void expandFlexBar() {
    Future.microtask(() => _animate(0));
  }

  void hardCollapseFlexBar() {
    Future.microtask(() => _controller.jumpTo(_flexbarHeight));
  }

  void _animate(double snapOffset) {
    _controller.animateTo(
      snapOffset,
      duration: kAnimationDuration,
      curve: Curves.easeOut,
    );
  }
}
