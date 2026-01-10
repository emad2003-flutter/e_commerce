import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 91.h,
                bottom: 10.h,
                left: 97.w,
                right: 97.w,
              ),
              child: Image.asset(AppAssets.appBarLeading),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Full Name", style: AppStyles.medium18White),
                          CustomTextFormField(
                            isPassword: false,
                            keyboardType: TextInputType.name,
                            isObscureText: false,
                            hintText: "enter your full name",
                            hintStyle: AppStyles.light18HintText,
                            filledColor: AppColors.whiteColor,
                            controller: _fullNameController,
                            validator: AppValidators.validateFullName,
                          ),
                          Text("Mobile Number", style: AppStyles.medium18White),
                          CustomTextFormField(
                            isPassword: false,
                            keyboardType: TextInputType.phone,
                            isObscureText: false,
                            hintText: "enter your mobile number",
                            hintStyle: AppStyles.light18HintText,
                            filledColor: AppColors.whiteColor,
                            controller: _phoneController,
                            validator: AppValidators.validatePhoneNumber,
                          ),
                          Text(
                            "E-mail address",
                            style: AppStyles.medium18White,
                          ),
                          CustomTextFormField(
                            isPassword: false,
                            keyboardType: TextInputType.emailAddress,
                            isObscureText: false,
                            hintText: "enter your email address",
                            hintStyle: AppStyles.light18HintText,
                            filledColor: AppColors.whiteColor,
                            controller: _mailController,
                            validator: AppValidators.validateEmail,
                          ),
                          Text("Password", style: AppStyles.medium18White),
                          CustomTextFormField(
                            isPassword: true,
                            keyboardType: TextInputType.visiblePassword,
                            isObscureText: true,
                            hintText: "enter your password",
                            hintStyle: AppStyles.light18HintText,
                            filledColor: AppColors.whiteColor,
                            controller: _passwordController,
                            validator: AppValidators.validatePassword,
                          ),
                          Text("RePassword", style: AppStyles.medium18White),
                          CustomTextFormField(
                            isPassword: true,
                            keyboardType: TextInputType.visiblePassword,
                            isObscureText: true,
                            hintText: "enter your password again",
                            hintStyle: AppStyles.light18HintText,
                            filledColor: AppColors.whiteColor,
                            controller: _rePasswordController,
                            validator: (value) {
                              return AppValidators.validateConfirmPassword(
                                value,
                                _passwordController.text,
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 35.h),
                            child: CustomElevatedButton(
                              backgroundColor: AppColors.whiteColor,
                              textStyle: AppStyles.semi20Primary,
                              text: "Sign up",
                              onPressed: () {},
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoutes.loginRoute,
                                );
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      'Already have an account? login',
                                      style: AppStyles.medium18White,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
