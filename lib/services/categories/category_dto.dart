import 'package:events/domain/categories/category.dart';
import 'package:events/domain/core/event_counter.dart';
import 'package:events/domain/core/value_objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@freezed
abstract class CategoryDto implements _$CategoryDto {
  const CategoryDto._();

  const factory CategoryDto({
    @JsonKey(ignore: true) String name,
    @required int icon,
    @required int liveEvents,
    @required int totalEvents,
  }) = _CategoryDto;

  factory CategoryDto.fromDomain(Category category) {
    return CategoryDto(
      name: category.name,
      icon: category.icon.codePoint,
      liveEvents: category.eventCounter.live,
      totalEvents: category.eventCounter.total,
    );
  }

  Category toDomain() {
    return Category(
      name: name,
      icon: IconData(icon, fontFamily: 'MaterialIcons'),
      eventCounter: EventCounter(live: liveEvents, total: totalEvents),
    );
  }

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  factory CategoryDto.fromFirestore(DocumentSnapshot doc) =>
      CategoryDto.fromJson(doc.data()).copyWith(name: doc.id);
}
