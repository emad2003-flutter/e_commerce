import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/features/ui/auth/register/cubit/register_states.dart';
import 'package:e_commerce/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:e_commerce/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterViewModel viewModel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterState>(
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

  void _blocListener(BuildContext context, RegisterState state) {
    if (state is RegisterLoadingStates) {
      DialogUtils.showLoading(context: context, message: "Loading...");
    } else if (state is RegisterErrorStates) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
        context: context,
        message: state.failure.message,
        title: "Error",
        negActionName: "OK",
      );
    } else if (state is RegisterSuccessStates) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
        context: context,
        message: "Registration successful!",
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
            _buildFullNameField(),
            _buildPhoneField(),
            _buildEmailField(),
            _buildPasswordField(),
            _buildConfirmPasswordField(),
            _buildRegisterButton(),
            _buildLoginText(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFullNameField() {
    return _buildField(
      title: "Full Name",
      hint: "enter your full name",
      controller: viewModel.fullNameController,
      keyboardType: TextInputType.name,
      validator: AppValidators.validateFullName,
    );
  }

  Widget _buildPhoneField() {
    return _buildField(
      title: "Mobile Number",
      hint: "enter your mobile number",
      controller: viewModel.phoneController,
      keyboardType: TextInputType.phone,
      validator: AppValidators.validatePhoneNumber,
    );
  }

  Widget _buildEmailField() {
    return _buildField(
      title: "E-mail address",
      hint: "enter your email address",
      controller: viewModel.mailController,
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

  Widget _buildConfirmPasswordField() {
    return _buildField(
      title: "RePassword",
      hint: "enter your password again",
      controller: viewModel.rePasswordController,
      keyboardType: TextInputType.visiblePassword,
      isPassword: true,
      validator: (value) {
        return AppValidators.validateConfirmPassword(
          value,
          viewModel.passwordController.text,
        );
      },
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

  Widget _buildRegisterButton() {
    return Padding(
      padding: EdgeInsets.only(top: 35.h),
      child: CustomElevatedButton(
        backgroundColor: AppColors.whiteColor,
        textStyle: AppStyles.semi20Primary,
        text: "Sign up",
        onPressed: () {
          viewModel.register();
        },
      ),
    );
  }

  Widget _buildLoginText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
        },
        child: Text(
          'Already have an account? login',
          textAlign: TextAlign.center,
          style: AppStyles.medium18White,
        ),
      ),
    );
  }
}
