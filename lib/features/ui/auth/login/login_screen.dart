import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/features/ui/auth/login/cubit/login_states.dart';
import 'package:e_commerce/features/ui/auth/login/cubit/login_view_model.dart';
import 'package:e_commerce/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginState>(
      bloc: viewModel,
      listener: _blocListener,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SingleChildScrollView(
            child: Column(children: [_buildLogo(), _buildFormSection(context)]),
          ),
        ),
      ),
    );
  }

  void _blocListener(BuildContext context, LoginState state) {
    if (state is LoginLoading) {
      DialogUtils.showLoading(context: context, message: "Loading...");
    } else if (state is LoginFailure) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
        context: context,
        message: state.message,
        title: "Error",
        negActionName: "OK",
      );
    } else if (state is LoginSuccess) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
        context: context,
        message: "Login successful!",
        title: "Success",
        posActionName: "OK",
      );
    }
  }

  Widget _buildLogo() {
    return Padding(
      padding: EdgeInsets.only(
        top: 91.h,
        bottom: 10.h,
        left: 97.w,
        right: 97.w,
      ),
      child: Image.asset(AppAssets.appBarLeading),
    );
  }

  Widget _buildFormSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: viewModel.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40.h),
            _buildEmailField(),
            _buildPasswordField(),
            _buildLoginButton(),
            _buildLoginText(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return _buildField(
      title: "E-mail address",
      hint: "enter your email address",
      controller: viewModel.emailController,
      keyboardType: TextInputType.emailAddress,
      validator: AppValidators.validateEmail,
    );
  }

  Widget _buildPasswordField() {
    return _buildField(
      title: "Password",
      hint: "enter your password",
      controller: viewModel.passwordController,
      keyboardType: TextInputType.visiblePassword,
      isPassword: true,
      validator: AppValidators.validatePassword,
    );
  }

  Widget _buildField({
    required String title,
    required String hint,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required String? Function(String?) validator,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.medium18White),
        CustomTextFormField(
          isPassword: isPassword,
          isObscureText: isPassword,
          keyboardType: keyboardType,
          hintText: hint,
          hintStyle: AppStyles.light18HintText,
          filledColor: AppColors.whiteColor,
          controller: controller,
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: EdgeInsets.only(top: 35.h),
      child: CustomElevatedButton(
        backgroundColor: AppColors.whiteColor,
        textStyle: AppStyles.semi20Primary,
        text: "Sign In",
        onPressed: () {
          viewModel.login();
        },
      ),
    );
  }

  Widget _buildLoginText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, AppRoutes.registerRoute);
        },
        child: Text(
          'Don\'t have an account? Sign Up',
          textAlign: TextAlign.center,
          style: AppStyles.medium18White,
        ),
      ),
    );
  }
}
