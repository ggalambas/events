import 'dart:io';
import 'package:events/domain/core/value_objects.dart';
import 'package:events/domain/events/event.dart';
import 'package:events/domain/events/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_dto.freezed.dart';
part 'event_dto.g.dart';

//TODO
//* 1. store poster on cloud

@freezed
abstract class EventDto implements _$EventDto {
  const EventDto._();

  const factory EventDto({
    @JsonKey(ignore: true) String id,
    @required String name,
    @required @ServerTimeStampConverter() Timestamp date,
    @required @ServerTimeStampConverter() Timestamp day,
    @required String link,
    @required String regionId,
    @required String subregionId,
    @required String categoryId,
    @required String poster, //! 1
    @required String ownerId,
  }) = _EventDto;

  factory EventDto.fromDomain(Event event) {
    return EventDto(
      id: event.id.getOrCrash(),
      name: event.name.getOrCrash(),
      date: Timestamp.fromDate(event.date),
      day: Timestamp.fromDate(
          DateTime(event.date.year, event.date.month, event.date.day)),
      link: event.link.getOrCrash(),
      regionId: event.regionId,
      subregionId: event.subregionId,
      categoryId: event.categoryId,
      poster: event.poster.getOrCrash().path, //! 1
      ownerId: event.ownerId.getOrCrash(),
    );
  }

  Event toDomain() {
    return Event(
      id: UniqueId.fromUniqueString(id),
      name: EventName(name),
      date: date.toDate(),
      link: EventLink(link),
      regionId: regionId,
      subregionId: subregionId,
      categoryId: categoryId,
      poster: Poster(File(poster)), //! 1
      ownerId: UniqueId.fromUniqueString(ownerId),
    );
  }

  factory EventDto.fromJson(Map<String, dynamic> json) =>
      _$EventDtoFromJson(json);

  factory EventDto.fromFirestore(DocumentSnapshot doc) =>
      EventDto.fromJson(doc.data()).copyWith(id: doc.id);
}

class ServerTimeStampConverter implements JsonConverter<Timestamp, int> {
  const ServerTimeStampConverter();

  @override
  Timestamp fromJson(int json) => Timestamp.fromMicrosecondsSinceEpoch(json);

  @override
  int toJson(Timestamp date) => date.microsecondsSinceEpoch;
}
