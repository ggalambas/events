import 'package:dartz/dartz.dart';
import 'package:events/domain/events/event.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/domain/regions/region.dart';
import 'package:events/domain/core/repository_failure.dart';

abstract class IEventRepository {
  DateTime selectedDay;

  Stream<Either<RepositoryFailure, List<Category>>> categoryCounters();
  Stream<Either<RepositoryFailure, List<Region>>> dayCounters();
  Stream<Either<RepositoryFailure, List<Region>>> regionCounters();

  Stream<Either<RepositoryFailure, List<Event>>> watchSelected();
  Stream<Either<RepositoryFailure, List<Event>>> watchAll();
  Future<Either<RepositoryFailure, Unit>> create(Event event);
  Future<Either<RepositoryFailure, Unit>> update(Event event);
  Future<Either<RepositoryFailure, Unit>> delete(Event event);
}
