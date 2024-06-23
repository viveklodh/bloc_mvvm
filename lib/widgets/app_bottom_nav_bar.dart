import 'package:flutter/material.dart';
import 'package:flutter_bloc_mvvm_example/core/utils/app_colors.dart';
import 'package:flutter_bloc_mvvm_example/core/utils/app_image_path.dart';
import 'package:flutter_bloc_mvvm_example/core/utils/dimens.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.height60,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.textFieldBorderColor)),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: Image.asset(AppImagePath.home,
                    color: selectedIndex == 0 ? null : Colors.grey)),
          ),
          Expanded(
            child: InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: Image.asset(AppImagePath.cart,
                    color:
                        selectedIndex == 1 ? AppColors.appColor : Colors.grey)),
          ),
          Expanded(
            child: InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                child: Image.asset(AppImagePath.profile,
                    color:
                        selectedIndex == 2 ? AppColors.appColor : Colors.grey)),
          )
        ],
      ),
    );
  }
}
