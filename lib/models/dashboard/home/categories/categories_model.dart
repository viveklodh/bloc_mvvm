

class CategoriesModel {
  String? label;
  List<CategoriesCardModel>? listOfCards;
  CategoriesModel({this.label,this.listOfCards});
}

class CategoriesCardModel {
  String? label;
  int? totalItems;
  String? imagePath;
  List<CategoriesCardDetailsModel>? listOfItems;

  CategoriesCardModel(
      {this.label, this.totalItems, this.imagePath, this.listOfItems});
}

class CategoriesCardDetailsModel {
  String? label;
  String? price;
  bool? isLiked;
  String? imagePath;

  CategoriesCardDetailsModel({this.label, this.price, this.isLiked,this.imagePath});
}
