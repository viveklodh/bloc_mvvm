import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class SelectChipEvent extends CategoryEvent {
 int selectedIndex;
 SelectChipEvent(this.selectedIndex);
  @override
  List<Object> get props => [selectedIndex];
}


class LikeEvent extends CategoryEvent {
  bool isLiked = false;
  LikeEvent(this.isLiked);

  @override
  List<Object> get props => [isLiked];
}