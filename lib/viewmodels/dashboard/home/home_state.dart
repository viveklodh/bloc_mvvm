import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_mvvm_example/models/dashboard/home/categories/categories_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final CategoriesModel categoriesModel;
  const HomeLoadedState(this.categoriesModel);
}

class HomeErrorState extends HomeState {
  final String? message;
  const HomeErrorState(this.message);
}