import 'package:events/domain/core/event_counter.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@freezed
abstract class Category with _$Category {
  const factory Category({
    @required String name,
    @required IconData icon,
    @required EventCounter eventCounter,
  }) = _Category;
}
