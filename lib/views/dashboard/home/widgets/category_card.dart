import 'package:flutter/material.dart';
import 'package:flutter_bloc_mvvm_example/core/utils/app_colors.dart';
import 'package:flutter_bloc_mvvm_example/core/utils/dimens.dart';
import 'package:flutter_bloc_mvvm_example/models/dashboard/home/categories/categories_model.dart';

class CategoryCard extends StatelessWidget {
  CategoriesCardModel categoriesCardModel;
  CategoryCard({super.key, required this.categoriesCardModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.textFieldBorderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           //
           _cardImage(),
          //
          _cardLabel(),
          //
          _cardElementsCount()
          //
        ],
      ),
    );
  }

 Widget _cardImage() {
    return   Image.asset(categoriesCardModel.imagePath ?? "",
        height: Dimens.height100,
        width: double.infinity,
        fit: BoxFit.fill);
  }

 Widget _cardLabel() {
    return  Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
      child: Text(
        categoriesCardModel.label ?? "",
        style: TextStyle(
            color: AppColors.appColor,
            fontSize: Dimens.fontSize16,
            fontWeight: FontWeight.w700),
      ),
    );
  }

 Widget _cardElementsCount() {
    return  Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
      child: Text(
        '(${categoriesCardModel.totalItems})',
        style: TextStyle(
          color: AppColors.grey,
          fontSize: Dimens.fontSize10,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
