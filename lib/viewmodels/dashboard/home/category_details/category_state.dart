import 'package:equatable/equatable.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}
/// chip states
class ChipInitialState extends CategoryState {}

class ChipLoadingState extends CategoryState {}

class ChipLoadedState extends CategoryState {
  final int selectedIndex;
  const ChipLoadedState(this.selectedIndex);
}

class ChipErrorState extends CategoryState {
  final String? message;
  const ChipErrorState(this.message);
}

/// like states
class LikeInitialState extends CategoryState {}

class LikeLoadingState extends CategoryState {}

class LikeLoadedState extends CategoryState {
  final bool isLiked;
  const LikeLoadedState(this.isLiked);
}

class LikeErrorState extends CategoryState {
  final String? message;
  const LikeErrorState(this.message);
}