import 'package:dartz/dartz.dart';
import 'package:events/domain/events/event.dart';
import 'package:events/domain/events/event_failure.dart';
import 'package:events/ui/body/components/event_counters.dart';

abstract class IEventRepository {
  // Stream<Either<EventFailure, Map<String, EventCounter>>> categoryCounters();
  // Stream<Either<EventFailure, EventCounter>> dayCounters(
  //     String category, DateTime day);
  // Stream<Either<EventFailure, Map<String, EventCounter>>> regionCounters(
  //   String category,
  //   DateTime day,
  // );
  // Stream<Either<EventFailure, List<Event>>> dayEvents(
  //   String category,
  //   DateTime day,
  // );
  // Stream<Either<EventFailure, List<Event>>> regionEvents(
  //   String category,
  //   DateTime day,
  //   String region,
  // );
}
