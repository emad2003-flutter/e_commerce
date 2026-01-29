import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/ui/pages/home_screen/cubit/home_states.dart';
import 'package:e_commerce/features/ui/pages/home_screen/cubit/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeViewModel viewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeViewModel, HomeStates>(
      bloc: viewModel,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: viewModel.homeTaps[viewModel.selectedIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Theme(
              data: Theme.of(
                context,
              ).copyWith(canvasColor: AppColors.primaryColor),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                currentIndex: viewModel.selectedIndex,
                onTap: viewModel.pageChange,

                ///viewModel.bottomNavOnTap,
                iconSize: 24.sp, // Adjust the icon size
                items: [
                  _bottomNavBarItemBuilder(
                    isSelected: viewModel.selectedIndex == 0,
                    selectedIcon: AppAssets.selectedHomeIcon,
                    unselectedIcon: AppAssets.unSelectedHomeIcon,
                  ),
                  _bottomNavBarItemBuilder(
                    isSelected: viewModel.selectedIndex == 1,
                    selectedIcon: AppAssets.selectedCategoryIcon,
                    unselectedIcon: AppAssets.unSelectedCategoryIcon,
                  ),
                  _bottomNavBarItemBuilder(
                    isSelected: viewModel.selectedIndex == 2,
                    selectedIcon: AppAssets.selectedFavouriteIcon,
                    unselectedIcon: AppAssets.unSelectedFavouriteIcon,
                  ),
                  _bottomNavBarItemBuilder(
                    isSelected: viewModel.selectedIndex == 3,
                    selectedIcon: AppAssets.selectedAccountIcon,
                    unselectedIcon: AppAssets.unSelectedAccountIcon,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _bottomNavBarItemBuilder({
    required bool isSelected,
    required String selectedIcon,
    required String unselectedIcon,
  }) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        foregroundColor: isSelected
            ? AppColors.primaryColor
            : AppColors.whiteColor,
        backgroundColor: isSelected ? AppColors.whiteColor : Colors.transparent,
        radius: 25.r,
        child: Image.asset(isSelected ? selectedIcon : unselectedIcon),
      ),
      label: "",
    );
  }
}
