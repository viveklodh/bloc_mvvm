import 'package:flutter/material.dart';
import 'package:flutter_bloc_mvvm_example/core/utils/app_image_path.dart';
import 'package:flutter_bloc_mvvm_example/core/utils/dimens.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImagePath.backArrow,
        height: Dimens.height12, width: Dimens.width12);
  }
}
