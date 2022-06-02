import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'categories_state.dart';
part 'categories_event.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc({required Repository repository})
      : _repository = repository,
        super(const CategoriesState()) {
    on<CategoriesInitEvent>(_onCategoriesInitEvent);
  }

  final Repository _repository;

  void _onCategoriesInitEvent(CategoriesInitEvent event, Emitter<CategoriesState> emit) {
    var categories = _repository.categories;

    if (categories != null) {
      emit(state.copyWith(categories: categories));
    }
  }
}
