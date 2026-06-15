import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_consts.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_themes.dart';
import 'package:e_commerce/core/utils/my_bloc_observer.dart';
import 'package:e_commerce/core/utils/shared_pref_helper.dart';
import 'package:e_commerce/features/ui/auth/login/login_screen.dart';
import 'package:e_commerce/features/ui/auth/register/register_screen.dart';
import 'package:e_commerce/features/ui/pages/home_screen/home_screen.dart';
import 'package:e_commerce/features/ui/pages/home_screen/taps/products_tap/products_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool userLoggedIn = false;
void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  isUserLoggedIn();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: userLoggedIn
              ? AppRoutes.homeRoute
              : AppRoutes.loginRoute,
          routes: {
            AppRoutes.loginRoute: (context) => LoginScreen(),
            AppRoutes.registerRoute: (context) => RegisterScreen(),
            AppRoutes.homeRoute: (context) => HomeScreen(),
            AppRoutes.productDetailsRoute: (context) => ProductDetailsScreen(),
          },
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}

Future<void> isUserLoggedIn() async {
  String? token = await SharedPrefHelper.getString(AppConsts.userToken);
  if (token != null && token.isNotEmpty) {
    userLoggedIn = true;
  } else {
    userLoggedIn = false;
  }
}
