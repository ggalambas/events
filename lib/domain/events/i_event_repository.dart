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

  Stream<Either<EventFailure, List<Category>>> categories();
  Stream<Either<EventFailure, List<Region>>> regions();
  Stream<Either<EventFailure, List<Subregion>>> subregions();
  Stream<Either<EventFailure, Event>> event(String eventId); //!
  // Stream<Either<EventFailure, List<Event>>> dayEvents(
  //   String category,
  //   DateTime day,
  // );
  // Stream<Either<EventFailure, List<Event>>> regionEvents(
  //   String category,
  //   DateTime day,
  //   String region,
  // );
  Future<Either<EventFailure, Unit>> create(Event event);
  Future<Either<EventFailure, Unit>> update(Event event);
  Future<Either<EventFailure, Unit>> delete(Event event);
}
