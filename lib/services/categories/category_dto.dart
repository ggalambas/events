import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/domain/categories/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@freezed
abstract class CategoryDto implements _$CategoryDto {
  const CategoryDto._();

  const factory CategoryDto({
    @JsonKey(ignore: true) String id,
    @required String name,
    @required int icon,
  }) = _CategoryDto;

  factory CategoryDto.fromDomain(Category category) {
    return CategoryDto(
      id: category.id,
      name: category.name,
      icon: category.icon.codePoint,
    );
  }

  Category toDomain() {
    return Category(
      id: id,
      name: name,
      icon: IconData(icon, fontFamily: 'MaterialIcons'),
    );
  }

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  factory CategoryDto.fromFirestore(DocumentSnapshot doc) =>
      CategoryDto.fromJson(doc.data()).copyWith(id: doc.id);
}
