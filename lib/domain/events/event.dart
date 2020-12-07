import 'package:events/domain/core/value_objects.dart';
import 'package:events/domain/events/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class Event with _$Event {
  const factory Event({
    @required UniqueId id,
    @required EventName name,
    @required DateTime date,
    @required EventLink link,
    @required UniqueId subregionId,
    @required UniqueId categoryId,
    @required Poster poster,
    // @required UniqueId ownerId,
  }) = _Event;
}
