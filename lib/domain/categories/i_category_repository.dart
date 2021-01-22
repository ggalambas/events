import 'package:dartz/dartz.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/domain/core/repository_failure.dart';

abstract class ICategoryRepository {
  Category selected;
  Future<Category> initial();

  Future<Either<RepositoryFailure, List<Category>>> getAll();
  Future<Either<RepositoryFailure, Unit>> create(Category category);
  Future<Either<RepositoryFailure, Unit>> update(Category category);
  Future<Either<RepositoryFailure, Unit>> delete(Category category);
}
