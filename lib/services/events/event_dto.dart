import 'package:events/domain/core/value_objects.dart';
import 'package:events/domain/events/event.dart';
import 'package:events/domain/events/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_dto.freezed.dart';
part 'event_dto.g.dart';

@freezed
abstract class EventDto implements _$EventDto {
  const EventDto._();

  const factory EventDto({
    @JsonKey(ignore: true) String id,
    @required String name,
    @required @ServerTimeStampConverter() Timestamp time,
    @required String link,
  }) = _EventDto;

  factory EventDto.fromDomain(Event event) {
    return EventDto(
      id: event.id.getOrCrash(),
      name: event.name.getOrCrash(),
      time: Timestamp.fromDate(event.time),
      link: event.link.getOrCrash(),
    );
  }

  Event toDomain() {
    return Event(
      id: UniqueId.fromUniqueString(id),
      name: EventName(name),
      time: time.toDate(),
      link: EventLink(link),
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
  int toJson(Timestamp time) => time.microsecondsSinceEpoch;
}
