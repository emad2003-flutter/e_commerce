import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/categories_or_brands_response_entity.dart';
import 'package:e_commerce/features/ui/pages/home_screen/taps/home_tap/cubit/home_tap_states.dart';
import 'package:e_commerce/features/ui/pages/home_screen/taps/home_tap/cubit/home_tap_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  HomeTapViewModel viewModel = getIt<HomeTapViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.fetchCategories();
    viewModel.fetchBrands();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h),
        child: Column(
          children: [
            _announcementSection(),
            SizedBox(height: 24.h),
            BlocBuilder<HomeTapViewModel, HomeTapStates>(
              bloc: viewModel,
              builder: (context, state) {
                return viewModel.categoriesResponseEntity == null
                    ? CircularProgressIndicator()
                    : _categoriesSection(viewModel.categoriesResponseEntity!);
              },
            ),
            SizedBox(height: 24.h),
            BlocBuilder<HomeTapViewModel, HomeTapStates>(
              bloc: viewModel,
              builder: (context, state) {
                return state is BrandsLoaded
                    ? _brandsSection(state.categoriesOrBrandsResponseEntity)
                    : state is BrandsError
                    ? Text(state.message)
                    : CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _announcementSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: ImageSlideshow(
        indicatorRadius: 7.r,
        width: double.infinity,
        height: 200.h,
        initialPage: 0,
        indicatorColor: AppColors.primaryColor,
        indicatorBackgroundColor: Colors.grey,
        autoPlayInterval: 3000,
        isLoop: true,
        children: [
          Image.asset(AppAssets.announcement1, fit: BoxFit.cover),
          Image.asset(AppAssets.announcement2, fit: BoxFit.cover),
          Image.asset(AppAssets.announcement3, fit: BoxFit.cover),
        ],
      ),
    );
  }

  Widget _categoriesSection(
    CategoriesOrBrandsResponseEntity categoriesOrBrandsResponseEntity,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Categories", style: AppStyles.semi20Primary),
            TextButton(
              onPressed: () {},
              child: Text(
                "View all",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 300.h,
          width: double.infinity,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 12.w,
              childAspectRatio: 1.5,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: categoriesOrBrandsResponseEntity.dataEntity?.length ?? 0,
            itemBuilder: (context, index) {
              return _categoryItem(
                categoriesOrBrandsResponseEntity.dataEntity![index].image ?? "",
                categoriesOrBrandsResponseEntity.dataEntity![index].name ?? "",
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _brandsSection(
    CategoriesOrBrandsResponseEntity categoriesOrBrandsResponseEntity,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Brands", style: AppStyles.semi20Primary),
            TextButton(
              onPressed: () {},
              child: Text(
                "View all",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 300.h,
          width: double.infinity,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 12.w,
              childAspectRatio: 1.5,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: categoriesOrBrandsResponseEntity.dataEntity?.length ?? 0,
            itemBuilder: (context, index) {
              return _categoryItem(
                categoriesOrBrandsResponseEntity.dataEntity![index].image ?? "",
                categoriesOrBrandsResponseEntity.dataEntity![index].name ?? "",
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _categoryItem(String imageUrl, String categotryName) {
    return Column(
      children: [
        Expanded(
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            width: 50.w,
            height: 50.h,
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(height: 8.h),
        Expanded(
          child: Text(
            categotryName,
            style: AppStyles.medium14PrimaryDark,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
