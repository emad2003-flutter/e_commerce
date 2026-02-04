import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/ui/pages/home_screen/cubit/home_states.dart';
import 'package:e_commerce/features/ui/pages/home_screen/cubit/home_view_model.dart';
import 'package:e_commerce/features/ui/widgets/custom_text_form_field.dart';
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
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          label: const Text("what do you search for?"),
                          borderColor: AppColors.primaryColor,
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.primaryColor,
                            size: 34.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColors.primaryColor,
                          size: 34.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(child: viewModel.homeTaps[viewModel.selectedIndex]),
              ],
            ),
          ),

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
                iconSize: 24.sp,
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
      label: "",
      icon: CircleAvatar(
        radius: 22.r,
        backgroundColor: isSelected ? AppColors.whiteColor : Colors.transparent,
        child: Image.asset(isSelected ? selectedIcon : unselectedIcon),
      ),
    );
  }
}
/********************************************************************************/

// import 'package:e_commerce/core/utils/app_assets.dart';
// import 'package:e_commerce/core/utils/app_colors.dart';
// import 'package:e_commerce/features/ui/pages/home_screen/cubit/home_states.dart';
// import 'package:e_commerce/features/ui/pages/home_screen/cubit/home_view_model.dart';
// import 'package:e_commerce/features/ui/widgets/custom_text_form_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});
//   final HomeViewModel viewModel = HomeViewModel();
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeViewModel, HomeStates>(
//       bloc: viewModel,
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Scaffold(
//           body: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 child: Row(
//                   children: [
//                     CustomTextFormField(
//                       label: Text("what do you search for?"),
//                       borderColor: AppColors.primaryColor,
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.add_shopping_cart),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           bottomNavigationBar: ClipRRect(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(16.r),
//               topRight: Radius.circular(16.r),
//             ),
//             child: Theme(
//               data: Theme.of(
//                 context,
//               ).copyWith(canvasColor: AppColors.primaryColor),
//               child: BottomNavigationBar(
//                 type: BottomNavigationBarType.fixed,
//                 elevation: 0,
//                 currentIndex: viewModel.selectedIndex,
//                 onTap: viewModel.pageChange,

//                 ///viewModel.bottomNavOnTap,
//                 iconSize: 24.sp, // Adjust the icon size
//                 items: [
//                   _bottomNavBarItemBuilder(
//                     isSelected: viewModel.selectedIndex == 0,
//                     selectedIcon: AppAssets.selectedHomeIcon,
//                     unselectedIcon: AppAssets.unSelectedHomeIcon,
//                   ),
//                   _bottomNavBarItemBuilder(
//                     isSelected: viewModel.selectedIndex == 1,
//                     selectedIcon: AppAssets.selectedCategoryIcon,
//                     unselectedIcon: AppAssets.unSelectedCategoryIcon,
//                   ),
//                   _bottomNavBarItemBuilder(
//                     isSelected: viewModel.selectedIndex == 2,
//                     selectedIcon: AppAssets.selectedFavouriteIcon,
//                     unselectedIcon: AppAssets.unSelectedFavouriteIcon,
//                   ),
//                   _bottomNavBarItemBuilder(
//                     isSelected: viewModel.selectedIndex == 3,
//                     selectedIcon: AppAssets.selectedAccountIcon,
//                     unselectedIcon: AppAssets.unSelectedAccountIcon,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   BottomNavigationBarItem _bottomNavBarItemBuilder({
//     required bool isSelected,
//     required String selectedIcon,
//     required String unselectedIcon,
//   }) {
//     return BottomNavigationBarItem(
//       icon: CircleAvatar(
//         foregroundColor: isSelected
//             ? AppColors.primaryColor
//             : AppColors.whiteColor,
//         backgroundColor: isSelected ? AppColors.whiteColor : Colors.transparent,
//         radius: 25.r,
//         child: Image.asset(isSelected ? selectedIcon : unselectedIcon),
//       ),
//       label: "",
//     );
//   }
// }
