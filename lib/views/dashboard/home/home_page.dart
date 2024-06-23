import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mvvm_example/core/utils/app_colors.dart';
import 'package:flutter_bloc_mvvm_example/core/utils/dimens.dart';
import 'package:flutter_bloc_mvvm_example/models/dashboard/home/categories/categories_model.dart';
import 'package:flutter_bloc_mvvm_example/viewmodels/dashboard/home/home_bloc.dart';
import 'package:flutter_bloc_mvvm_example/viewmodels/dashboard/home/home_event.dart';
import 'package:flutter_bloc_mvvm_example/viewmodels/dashboard/home/home_state.dart';
import 'package:flutter_bloc_mvvm_example/views/dashboard/home/category_details/category_details_page.dart';
import 'package:flutter_bloc_mvvm_example/views/dashboard/home/widgets/category_card.dart';
import 'package:flutter_bloc_mvvm_example/views/dashboard/widgets/custom_app_bar.dart';
import 'package:flutter_bloc_mvvm_example/widgets/app_bottom_nav_bar.dart';
import 'package:flutter_bloc_mvvm_example/widgets/app_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    _homeBloc.add(GetCategoriesListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<HomeBloc>(
        create: (_) => _homeBloc,
        child: Scaffold(
          backgroundColor: AppColors.appBackGroundColor,
          body: BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is HomeErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              }
            },
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeInitialState) {
                  return _buildLoading();
                } else if (state is HomeLoadingState) {
                  return _buildLoading();
                } else if (state is HomeLoadedState) {
                  return _buildHomeWidget(context, state.categoriesModel);
                } else if (state is HomeErrorState) {
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
          ),
          bottomNavigationBar: const AppBottomNavBar(),
        ),
      ),
    );
  }

  Widget _buildHomeWidget(BuildContext context, CategoriesModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
          _itemsListView(model),
          //
        ],
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _pageTitle() {
    return Text('Categories',
        style: TextStyle(
            color: AppColors.appColor,
            fontSize: Dimens.fontSize30,
            fontWeight: FontWeight.w700));
  }

  Widget _itemsListView(CategoriesModel model) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: 180,
        ),
        itemCount: model.listOfCards?.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryDetailsPage(model: model.listOfCards![index])));
            },
            child: CategoryCard(categoriesCardModel: model.listOfCards?[index] ?? CategoriesCardModel()),
          );
        },
      ),
    );
  }
}
