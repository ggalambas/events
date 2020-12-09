import 'package:events/domain/regions/subregion.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subregion_dto.freezed.dart';
part 'subregion_dto.g.dart';

@freezed
abstract class SubregionDto implements _$SubregionDto {
  const SubregionDto._();

  const factory SubregionDto({
    @JsonKey(ignore: true) String id,
    @JsonKey(ignore: true) String regionId,
    @required String name,
    @required List<String> eventIds,
  }) = _SubregionDto;

  factory SubregionDto.fromDomain(Subregion subregion) {
    return SubregionDto(
      id: subregion.id,
      regionId: subregion.regionId,
      name: subregion.name,
      eventIds: subregion.eventIds,
    );
  }

  Subregion toDomain() {
    return Subregion(
      id: id,
      regionId: regionId,
      name: name,
      eventIds: eventIds,
    );
  }

  factory SubregionDto.fromJson(Map<String, dynamic> json) =>
      _$SubregionDtoFromJson(json);

  factory SubregionDto.fromFirestore(DocumentSnapshot doc) =>
      SubregionDto.fromJson(doc.data())
          .copyWith(id: doc.id, regionId: doc.reference.parent.parent.id);
}
