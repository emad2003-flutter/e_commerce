import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h),
        child: Column(
          children: [
            _announcementSection(),
            SizedBox(height: 24.h),
            _categoriesSection(),
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
        height: 200,
        initialPage: 0,
        indicatorColor: AppColors.primaryColor,
        indicatorBackgroundColor: Colors.grey,
        children: [
          Image.asset(AppAssets.announcement1, fit: BoxFit.cover),
          Image.asset(AppAssets.announcement2, fit: BoxFit.cover),
          Image.asset(AppAssets.announcement3, fit: BoxFit.cover),
        ],
        autoPlayInterval: 3000,
        isLoop: true,
      ),
    );
  }

  Widget _categoriesSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categories",
              style: AppStyles.headline6.copyWith(fontSize: 18.sp),
            ),
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
      ],
    );
  }
}
