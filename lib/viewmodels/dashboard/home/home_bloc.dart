import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mvvm_example/core/utils/app_image_path.dart';
import 'package:flutter_bloc_mvvm_example/models/dashboard/home/categories/categories_model.dart';
import 'package:flutter_bloc_mvvm_example/viewmodels/dashboard/home/home_event.dart';
import 'package:flutter_bloc_mvvm_example/viewmodels/dashboard/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeInitialState()) {

    List<CategoriesCardModel> listOfCard = getCategoriesList();

    on<GetCategoriesListEvent>((event, emit) async {
      try {
        emit(HomeLoadingState());

        ///we can call here api repo or database
        CategoriesModel data = CategoriesModel(listOfCards: listOfCard);

        await Future.delayed(const Duration(seconds: 5), () {
          emit(HomeLoadedState(data));
        });
      } catch (e) {
        emit(const HomeErrorState("Failed to fetch data !!"));
      }
    });
  }


  ///created dummy list because we don't have apis now
  List<CategoriesCardModel> getCategoriesList() {
    return [
      CategoriesCardModel(
          label: "Vegetables",
          totalItems: 43,
          imagePath: AppImagePath.vegetables,
          listOfItems: [
            CategoriesCardDetailsModel(
                label: "Boston Lettuce", price: "1.10", isLiked: false,imagePath: AppImagePath.bostonLettuce),
            CategoriesCardDetailsModel(
                label: "Purple Cauliflower", price: "1.85", isLiked: true,imagePath: AppImagePath.purpleCauliflower),
            CategoriesCardDetailsModel(
                label: "Savoy Cabbage", price: "1.45", isLiked: false,imagePath: AppImagePath.savoyCabbage),
          ]),
      CategoriesCardModel(
          label: "Fruits",
          totalItems: 32,
          imagePath: AppImagePath.fruits,
          listOfItems: [
            CategoriesCardDetailsModel(
                label: "Boston Lettuce", price: "1.10", isLiked: false,imagePath: AppImagePath.bostonLettuce),
            CategoriesCardDetailsModel(
                label: "Purple Cauliflower", price: "1.85", isLiked: true,imagePath: AppImagePath.purpleCauliflower),
            CategoriesCardDetailsModel(
                label: "Savoy Cabbage", price: "1.45", isLiked: false,imagePath: AppImagePath.savoyCabbage),
          ]),
      CategoriesCardModel(
          label: "Bread",
          totalItems: 22,
          imagePath: AppImagePath.bread,
          listOfItems: [
            CategoriesCardDetailsModel(
                label: "Boston Lettuce", price: "1.10", isLiked: false,imagePath: AppImagePath.savoyCabbage),
            CategoriesCardDetailsModel(
                label: "Purple Cauliflower", price: "1.85", isLiked: true,imagePath: AppImagePath.savoyCabbage),
            CategoriesCardDetailsModel(
                label: "Savoy Cabbage", price: "1.45", isLiked: false,imagePath: AppImagePath.savoyCabbage),
          ]),
      CategoriesCardModel(
          label: "Sweets",
          totalItems: 56,
          imagePath: AppImagePath.sweets,
          listOfItems: [
            CategoriesCardDetailsModel(
                label: "Boston Lettuce", price: "1.10", isLiked: false,imagePath: AppImagePath.savoyCabbage),
            CategoriesCardDetailsModel(
                label: "Purple Cauliflower", price: "1.85", isLiked: true,imagePath: AppImagePath.savoyCabbage),
            CategoriesCardDetailsModel(
                label: "Savoy Cabbage", price: "1.45", isLiked: false,imagePath: AppImagePath.savoyCabbage),
          ]),
      CategoriesCardModel(
          label: "Pasta",
          totalItems: 18,
          imagePath: AppImagePath.pasta,
          listOfItems: [
            CategoriesCardDetailsModel(
                label: "Boston Lettuce", price: "1.10", isLiked: false,imagePath: AppImagePath.savoyCabbage),
            CategoriesCardDetailsModel(
                label: "Purple Cauliflower", price: "1.85", isLiked: true,imagePath: AppImagePath.savoyCabbage),
            CategoriesCardDetailsModel(
                label: "Savoy Cabbage", price: "1.45", isLiked: false,imagePath: AppImagePath.savoyCabbage),
          ]),
      CategoriesCardModel(
          label: "Drinks",
          totalItems: 21,
          imagePath: AppImagePath.drinks,
          listOfItems: [
            CategoriesCardDetailsModel(
                label: "Boston Lettuce", price: "1.10", isLiked: false,imagePath: AppImagePath.savoyCabbage),
            CategoriesCardDetailsModel(
                label: "Purple Cauliflower", price: "1.85", isLiked: true,imagePath: AppImagePath.savoyCabbage),
            CategoriesCardDetailsModel(
                label: "Savoy Cabbage", price: "1.45", isLiked: false,imagePath: AppImagePath.savoyCabbage),
          ]),
    ];
  }
}
