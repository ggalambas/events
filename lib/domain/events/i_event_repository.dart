import 'package:dartz/dartz.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/domain/events/event.dart';
import 'package:events/domain/events/event_failure.dart';
import 'package:events/domain/regions/region.dart';
import 'package:events/domain/regions/subregion.dart';

abstract class IEventRepository {
  Category selectedCategory;
  DateTime selectedDate;
  Region selectedRegion;

  Stream<Either<EventFailure, List<Category>>> categoryCounters();
  Stream<Either<EventFailure, List<Region>>> regionCounters();
  Stream<Either<EventFailure, List<Subregion>>> regionEvents();
  Future<List<Event>> subregionEvents(List<String> eventIds);
  // Stream<Either<EventFailure, List<Event>>> dayEvents(
  //   String category,
  //   DateTime day,
  // );
  // Stream<Either<EventFailure, List<Event>>> regionEvents(
  //   String category,
  //   DateTime day,
  //   String region,
  // );
  Future<Either<EventFailure, Unit>> createEvent(Event event);
}
