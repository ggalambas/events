import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subregion.freezed.dart';

@freezed
abstract class Subregion with _$Subregion {
  const factory Subregion({
    @required String id,
    @required String regionId, //?
    @required String name,
    @required List<String> eventIds,
  }) = _Subregion;
}
