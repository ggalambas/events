import 'package:events/domain/core/value_objects.dart';
import 'package:events/domain/regions/subregion.dart';
import 'package:events/services/events/event_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:events/services/core/firebase_helpers.dart';

part 'subregion_dto.freezed.dart';
part 'subregion_dto.g.dart';

@freezed
abstract class SubregionDto implements _$SubregionDto {
  const SubregionDto._();

  const factory SubregionDto({
    @JsonKey(ignore: true) String id,
    @JsonKey(ignore: true) String regionId,
    @required String name,
    @required List<String> events,
  }) = _SubregionDto;

  factory SubregionDto.fromDomain(Subregion subregion) {
    return SubregionDto(
      id: subregion.id.getOrCrash(),
      regionId: subregion.regionId.getOrCrash(),
      name: subregion.name,
      events: subregion.events
          .map((event) => EventDto.fromDomain(event).id)
          .toList(),
    );
  }

  //TODO: use abstraction, interface function
  Future<Subregion> toDomain() async {
    final List<DocumentSnapshot> eventDocs = await Future.wait(events
        .map((eventId) =>
            FirebaseFirestore.instance.eventsCollection.doc(eventId).get())
        .toList());
    return Subregion(
      id: UniqueId.fromUniqueString(id),
      regionId: UniqueId.fromUniqueString(regionId),
      name: name,
      events: eventDocs
          .map((doc) => EventDto.fromFirestore(doc).toDomain())
          .toList(),
    );
  }

  factory SubregionDto.fromJson(Map<String, dynamic> json) =>
      _$SubregionDtoFromJson(json);

  factory SubregionDto.fromFirestore(DocumentSnapshot doc) =>
      SubregionDto.fromJson(doc.data())
          .copyWith(id: doc.id, regionId: doc.reference.parent.parent.id);
}
