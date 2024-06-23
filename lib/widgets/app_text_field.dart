import 'package:flutter/material.dart';
import 'package:flutter_bloc_mvvm_example/core/utils/app_colors.dart';
import 'package:flutter_bloc_mvvm_example/core/utils/app_image_path.dart';
import 'package:flutter_bloc_mvvm_example/core/utils/dimens.dart';

class AppTextField extends StatelessWidget {
   const AppTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.height40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: AppColors.white,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AppImagePath.search,
              height: 8,
              width: 8,
            ),
          ),
          fillColor: AppColors.white,
          hintText: "Search",
          hintStyle: TextStyle(
              color: const Color(0xFF9586A8), fontSize: Dimens.fontSize14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: AppColors.textFieldBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: AppColors.textFieldBorderColor),
          ),
        ),
      ),
    );
  }
}
