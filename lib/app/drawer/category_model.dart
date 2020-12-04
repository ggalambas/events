import 'package:events/app/core/base_model.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/domain/events/event_failure.dart';
import 'package:events/domain/events/i_event_repository.dart';
import 'package:injectable/injectable.dart';

export 'package:events/app/core/base_model.dart';

@Injectable()
class CategoryModel extends BaseModel {
  final IEventRepository _eventRepository;

  CategoryModel(this._eventRepository) {
    listenToCategories();
  }

  List<Category> _categories = [];
  List<Category> get categories => _categories;

  EventFailure _failure;
  EventFailure get failure => _failure;

  String _selected = 'Initial'; //!
  String get selected => _selected;
  set selected(String categoryName) {
    _selected = categoryName;
    notifyListeners();
  }

  bool isSelected(String categoryName) => _selected == categoryName;

  void _loadSuccess(List<Category> categories) {
    _categories = categories;
    loadSuccess();
  }

  void _loadFailure(EventFailure f) {
    _failure = failure;
    loadFailure();
  }

  void listenToCategories() {
    loadInProgress();
    _eventRepository
        .categoryCounters()
        .listen((failureOrCategories) => failureOrCategories.fold(
              (f) => _loadFailure(f),
              (categories) => _loadSuccess(categories),
            ));
  }
}
