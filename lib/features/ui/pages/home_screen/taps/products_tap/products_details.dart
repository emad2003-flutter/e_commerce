import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_consts.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/shared_pref_helper.dart';
import 'package:e_commerce/domain/entities/product_response_entity.dart';
import 'package:e_commerce/features/ui/pages/home_screen/taps/products_tap/cubit/products_states.dart';
import 'package:e_commerce/features/ui/pages/home_screen/taps/products_tap/cubit/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int productCounter = 0;
  int selectedColor = -1;
  int selectedSize = -1;

  final List<int> sizes = [35, 38, 39, 40];
  final List<Color> colors = [
    Colors.red,
    Colors.blueAccent,
    Colors.green,
    Colors.yellow,
  ];

  final ProductsViewModel viewModel = getIt<ProductsViewModel>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as ProductEntity;

    return BlocConsumer<ProductsViewModel, ProductsStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is AddToCardLoadedState) {
          print('added to cart');
        } else if (state is AddToCardErrorState) {
          print('failed to add: ${state.message}');
          SharedPrefHelper.getString(AppConsts.userToken).then((token) {
            print('token : $token');
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildImageCarousel(args),
                  SizedBox(height: 24.h),
                  buildTitleAndPrice(args),
                  SizedBox(height: 16.h),
                  buildSalesInfo(args),
                  SizedBox(height: 16.h),
                  buildDescription(args),
                  SizedBox(height: 16.h),
                  buildOptionSection('Size', buildSizeSelector()),
                  SizedBox(height: 24.h),
                  buildOptionSection('Color', buildColorSelector()),
                  SizedBox(height: 48.h),
                  buildActionRow(args),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Product Details', style: AppStyles.semi20Primary),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget buildImageCarousel(ProductEntity args) {
    return ImageSlideshow(
      indicatorColor: AppColors.primaryColor,
      initialPage: 0,
      indicatorBottomPadding: 15.h,
      indicatorPadding: 8.w,
      indicatorRadius: 5,
      indicatorBackgroundColor: AppColors.whiteColor,
      isLoop: true,
      autoPlayInterval: 3000,
      height: 190.h,
      children: args.images!.map((url) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: CachedNetworkImage(
            width: double.infinity,
            height: 120.h,
            fit: BoxFit.fill,
            imageUrl: url,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(color: AppColors.yellowColor),
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, color: AppColors.redColor),
          ),
        );
      }).toList(),
    );
  }

  Widget buildTitleAndPrice(ProductEntity args) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(args.title ?? '', style: AppStyles.medium18Header),
        ),
        Text('EGP ${args.price}', style: AppStyles.medium18Header),
      ],
    );
  }

  Widget buildSalesInfo(ProductEntity args) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor.withOpacity(.3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Text(
            '${args.sold} Sold',
            overflow: TextOverflow.ellipsis,
            style: AppStyles.medium14PrimaryDark,
          ),
        ),
        SizedBox(width: 16.w),
        Image.asset(AppAssets.starIcon, width: 20.w),
        SizedBox(width: 4.w),
        Expanded(
          child: Text(
            '${args.ratingsAverage} (${args.ratingsQuantity})',
            overflow: TextOverflow.ellipsis,
            style: AppStyles.regular14Text,
          ),
        ),
        buildQuantityControl(),
      ],
    );
  }

  Widget buildQuantityControl() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if (productCounter > 0) {
                setState(() {
                  productCounter--;
                });
              }
            },
            child: Icon(
              Icons.remove_circle_outline,
              size: 20.w,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(width: 18.w),
          AutoSizeText('$productCounter', style: AppStyles.medium18White),
          SizedBox(width: 18.w),
          InkWell(
            onTap: () {
              setState(() {
                productCounter++;
              });
            },
            child: Icon(
              Icons.add_circle_outline,
              color: AppColors.whiteColor,
              size: 20.w,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDescription(ProductEntity args) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: AppStyles.medium18Header),
        SizedBox(height: 8.h),
        ReadMoreText(
          args.description ?? '',
          style: AppStyles.medium14LightPrimary,
          trimExpandedText: ' Read Less',
          trimCollapsedText: ' Read More',
          trimLines: 2,
          trimMode: TrimMode.Line,
          colorClickableText: AppColors.primaryColor,
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget buildOptionSection(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.medium18Header),
        SizedBox(height: 8.h),
        child,
      ],
    );
  }

  Widget buildSizeSelector() {
    return SizedBox(
      height: 45.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sizes.length,
        separatorBuilder: (context, index) => SizedBox(width: 17.w),
        itemBuilder: (context, index) {
          final isSelected = index == selectedSize;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSize = index;
              });
            },
            child: CircleAvatar(
              radius: 22.r,
              backgroundColor: isSelected
                  ? AppColors.primaryColor
                  : Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
                child: Text(
                  '${sizes[index]}',
                  style: AppStyles.regular14Text.copyWith(
                    color: isSelected
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildColorSelector() {
    return SizedBox(
      height: 45.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        separatorBuilder: (context, index) => SizedBox(width: 17.w),
        itemBuilder: (context, index) {
          final isSelected = index == selectedColor;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedColor = index;
              });
            },
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: colors[index],
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.check,
                  color: isSelected ? AppColors.whiteColor : Colors.transparent,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildActionRow(ProductEntity args) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total price',
              style: AppStyles.medium18Header.copyWith(
                color: AppColors.primaryColor.withOpacity(0.6),
              ),
            ),
            SizedBox(height: 12.h),
            Text('EGP ${args.price}', style: AppStyles.medium18Header),
          ],
        ),
        SizedBox(width: 33.w),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17.r),
              ),
              backgroundColor: AppColors.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
            ),
            onPressed: () {
              viewModel.addProductToCard(args.id ?? '');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_shopping_cart, color: AppColors.whiteColor),
                SizedBox(width: 15.w),
                AutoSizeText('Add To Cart', style: AppStyles.medium20White),
                SizedBox(width: 27.w),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
