import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mvvm_example/viewmodels/dashboard/home/category_details/category_event.dart';
import 'package:flutter_bloc_mvvm_example/viewmodels/dashboard/home/category_details/category_state.dart';


class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  CategoryBloc() : super(ChipInitialState()) {

    on<SelectChipEvent>((event, emit) async {
      try {
        emit(ChipLoadingState());
        emit(ChipLoadedState(event.selectedIndex));
      } catch (e) {
        emit(const ChipErrorState("Failed to fetch data !!"));
      }
    });


    on<LikeEvent>((event, emit) async {
      try {
        emit(LikeLoadingState());
        emit(LikeLoadedState(event.isLiked));
      } catch (e) {
        emit(const LikeErrorState("Failed to fetch data !!"));
      }
    });
  }

}