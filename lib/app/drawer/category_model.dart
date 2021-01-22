import 'package:events/app/core/base_model.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/domain/categories/i_category_repository.dart';
import 'package:events/domain/core/repository_failure.dart';
import 'package:events/domain/events/i_event_repository.dart';
import 'package:injectable/injectable.dart';
export 'package:events/app/core/base_model.dart';

//TODO
//* 1. Initial Category
//* 2. selected category
//* 3. load

@Injectable()
class CategoryModel extends BaseModel {
  final ICategoryRepository _categoryRepository;
  final IEventRepository _eventRepository;

  CategoryModel(this._categoryRepository, this._eventRepository) {
    listen();
  }

  List<Category> _categories = [];
  List<Category> get categories => _categories;

  RepositoryFailure _failure;
  RepositoryFailure get failure => _failure;

  void _loadSuccess(List<Category> categories) {
    _categories = categories;
    loadSuccess();
  }

  void _loadFailure(RepositoryFailure f) {
    _failure = failure;
    loadFailure();
  }

  void listen() {
    loadInProgress();
    _eventRepository
        .categoryCounters()
        .listen((failureOrCategories) => failureOrCategories.fold(
              (f) => _loadFailure(f),
              (categories) => _loadSuccess(categories),
            ));
  }

  //! 1
  //! 2
  Category get selected => _categoryRepository.selected;
  set selected(Category category) {
    _categoryRepository.selected = category;
    notifyListeners();
  }

  bool isSelected(Category category) => selected == category;
}
