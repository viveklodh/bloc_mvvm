import 'package:flutter/material.dart';
import 'package:flutter_bloc_mvvm_example/core/utils/app_colors.dart';
import 'package:flutter_bloc_mvvm_example/core/utils/app_image_path.dart';
import 'package:flutter_bloc_mvvm_example/core/utils/dimens.dart';
import 'package:flutter_bloc_mvvm_example/models/dashboard/home/categories/categories_model.dart';
import 'package:flutter_bloc_mvvm_example/views/dashboard/widgets/custom_app_bar.dart';
import 'package:flutter_bloc_mvvm_example/widgets/app_bottom_nav_bar.dart';
import 'package:flutter_bloc_mvvm_example/widgets/app_text_field.dart';



class CategoryDetailsPage extends StatelessWidget {
  CategoriesCardModel model;

  CategoryDetailsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appBackGroundColor,
        body: Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Image.asset(AppImagePath.greenTree,
                    height: 140, width: 140)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  SizedBox(height: Dimens.height20),
                  //
                  const CustomAppBar(),
                  //
                  SizedBox(height: Dimens.height16),
                  //
                  _pageTitle(),
                  //
                  SizedBox(height: Dimens.height16),
                  //
                  const AppTextField(),
                  //
                  SizedBox(height: Dimens.height20),
                  //
                  _chipsWidget(),
                  //
                  SizedBox(height: Dimens.height20),
                  //
                  _itemsListView(model),
                  //

                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const AppBottomNavBar(),
      ),
    );
  }

  Widget _pageTitle() {
    return Text(model.label??"",
        style: TextStyle(
            color: AppColors.appColor,
            fontSize: Dimens.fontSize30,
            fontWeight: FontWeight.w700));
  }

  Widget _itemsListView(CategoriesCardModel model) {
    return Expanded(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom:20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    _cardImage(index),
                    //
                    SizedBox(width: Dimens.width10),
                    //
                    Expanded(
                      child: SizedBox(
                        height: Dimens.height100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            //
                            _cardLabel(index),
                            //
                            _cardPrice(index)
                            //
                          ]),
                            _cardButtons(index)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  Widget _chipsWidget() {
    var listOfChip = ["Cabbage and lettuce (14)","Potatoes (10)","Onions and garlic (8)","Peppers (7)","Cabbage and lettuce (14)","Onions and garlic (8)","Peppers (7)","Potatoes (10)"];
    return Wrap(
      children: [
       ...List.generate(6, (index){
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
              margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
              decoration: ShapeDecoration(
                color: index ==0?Colors.deepPurple.shade100: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child:  Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                 index==0? Icon(Icons.done,size: 14,color: AppColors.appColor):SizedBox(),
                  Text(
                    listOfChip[index],
                    style: TextStyle(
                      color: index==0?AppColors.appColor: AppColors.grey,
                      fontSize: Dimens.fontSize12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
          );
        })
      ],
    );
  }

  Widget _cardImage(int index) {
    return SizedBox(
        height: Dimens.height100,
        width: Dimens.width150,
        child: Image.asset(
          model.listOfItems?[index].imagePath??"",
          fit: BoxFit.fill,
        ));
  }

  Widget _cardLabel(int index) {
    return   Text(    model.listOfItems?[index].label??"",
        style: TextStyle(
          color: AppColors.appColor,
          fontSize: Dimens.fontSize16,
          fontWeight: FontWeight.w600,
        ));
  }

 Widget _cardPrice(int index) {
    return     Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          model.listOfItems?[index].price??"",
          style: TextStyle(
            color: AppColors.appColor,
            fontSize: Dimens.fontSize20,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '€ / piece',
          style: TextStyle(
            color: AppColors.appColor,
            fontSize: Dimens.fontSize14,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  Widget _cardButtons(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _likeBtn(),
        _addToCartBtn()
      ],
    );
  }

 Widget _likeBtn() {
    return Container(
        width: Dimens.width50,
        height: Dimens.height30,
        decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    width: 1, color: Color(0xFFD8D0E3)),
                borderRadius: BorderRadius.circular(8))),
        child: Image.asset(AppImagePath.like));
  }

 Widget _addToCartBtn() {
    return  Container(
        width: Dimens.width50,
        height: Dimens.height30,
        decoration: ShapeDecoration(
            color: AppColors.green,
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    width: 1, color: Color(0xFFD8D0E3)),
                borderRadius: BorderRadius.circular(8))),
        child: Image.asset(AppImagePath.cart,color: AppColors.white));
  }
}
