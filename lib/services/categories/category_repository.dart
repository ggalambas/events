import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/domain/core/repository_failure.dart';
import 'package:events/domain/categories/i_category_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/services/categories/category_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:events/services/core/firebase_helpers.dart';

@LazySingleton(as: ICategoryRepository)
class CategoryRepository implements ICategoryRepository {
  //TODO
  //* 1. initial category
  //* 2. order categories by name, can it be done here
  //* or because of snapshots it must be done on the app?
  //* same for regions and eventsm dont forget

  final FirebaseFirestore _firestore;
  CategoryRepository(this._firestore);

  //! 1
  //! deal with failure
  @override
  Category selected = CategoryDto(
    id: '1fcu8T0MdMC2N8mev3Ci',
    name: 'Categoria 04',
    icon: 58947,
  ).toDomain();

  @override
  Future<Category> initial() async => CategoryDto(
        id: '1fcu8T0MdMC2N8mev3Ci',
        name: 'Categoria 04',
        icon: 58947,
      ).toDomain();

  //! deal with failure
  // @override
  // Future<Category> initial() async {
  //   final userDoc = await _firestore.userDocument();
  //   final userData = await userDoc.get().then((snapshot) => snapshot.data());
  //   final categories = _firestore.categoriesCollection;
  //   final initialSnapshot =
  //       await categories.doc(userData['initialCategory'] as String).get();

  //   return CategoryDto.fromFirestore(initialSnapshot).toDomain();
  // }

  @override
  Future<Either<RepositoryFailure, Map<String, Category>>> categories() async {
    final categories = _firestore.categoriesCollection;
    return categories
        .orderBy('name')
        .get()
        .then((snapshot) => right<RepositoryFailure, Map<String, Category>>(
              Map.fromEntries(snapshot.docs.map((doc) =>
                  MapEntry(doc.id, CategoryDto.fromFirestore(doc).toDomain()))),
            ))
        .catchError((e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left<RepositoryFailure, Map<String, Category>>(
            const RepositoryFailure.insufficientPermission());
      } else {
        return left<RepositoryFailure, Map<String, Category>>(
            const RepositoryFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<RepositoryFailure, List<Category>>> getAll() async {
    final categories = _firestore.categoriesCollection;
    return categories
        .orderBy('name')
        .get()
        .then((snapshot) => right<RepositoryFailure, List<Category>>(
              snapshot.docs
                  .map((doc) => CategoryDto.fromFirestore(doc).toDomain())
                  .toList(),
            ))
        .catchError((e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left<RepositoryFailure, List<Category>>(
            const RepositoryFailure.insufficientPermission());
      } else {
        return left<RepositoryFailure, List<Category>>(
            const RepositoryFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<RepositoryFailure, Unit>> create(Category category) async {
    try {
      final categories = _firestore.categoriesCollection;
      final categoryDto = CategoryDto.fromDomain(category);

      await categories.add(categoryDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const RepositoryFailure.insufficientPermission());
      } else {
        return left(const RepositoryFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<RepositoryFailure, Unit>> update(Category category) async {
    try {
      final categories = _firestore.categoriesCollection;
      final categoryDto = CategoryDto.fromDomain(category);

      await categories.doc(categoryDto.id).update(categoryDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const RepositoryFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const RepositoryFailure.unableToUpdate());
      } else {
        return left(const RepositoryFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<RepositoryFailure, Unit>> delete(Category category) async {
    try {
      final categories = _firestore.categoriesCollection;
      final categoryId = category.id;

      await categories.doc(categoryId).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const RepositoryFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const RepositoryFailure.unableToUpdate());
      } else {
        return left(const RepositoryFailure.unexpected());
      }
    }
  }
}
