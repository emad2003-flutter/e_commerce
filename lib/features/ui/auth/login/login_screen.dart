import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _brandImage(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome Back To Route", style: AppStyles.semi24White),
                    Text(
                      "Please sign in with your mail",
                      style: AppStyles.light16White,
                    ),
                    SizedBox(height: 40.h),
                    _loginForm(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("E-mail", style: AppStyles.medium18White),
          SizedBox(height: 24.h),
          CustomTextFormField(
            isPassword: false,
            keyboardType: TextInputType.text,
            isObscureText: false,
            hintText: "enter your email",
            hintStyle: AppStyles.light18HintText,
            filledColor: AppColors.whiteColor,
            controller: _emailController,
            validator: AppValidators.validateEmail,
          ),
          SizedBox(height: 32.h),
          Text("Password", style: AppStyles.medium18White),
          SizedBox(height: 24.h),
          CustomTextFormField(
            isPassword: true,
            keyboardType: TextInputType.text,
            isObscureText: true,
            hintText: "enter your Password",
            hintStyle: AppStyles.light18HintText,
            filledColor: AppColors.whiteColor,
            controller: _passwordController,
            validator: AppValidators.validateEmail,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.visibility_off),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Forgot Password',
              style: AppStyles.regular18White,
              textAlign: TextAlign.end,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.h),
            child: CustomElevatedButton(
              backgroundColor: AppColors.whiteColor,
              textStyle: AppStyles.semi20Primary,
              text: "Login",
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.registerRoute,
                );
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Don’t have an account? Create Account',
                      style: AppStyles.medium18White,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _brandImage() {
    return Padding(
      padding: EdgeInsets.only(
        top: 91.h,
        bottom: 87.h,
        left: 97.w,
        right: 79.w,
      ),
      child: Image.asset(AppAssets.appBarLeading),
    );
  }
}
