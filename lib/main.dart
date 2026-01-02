import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_themes.dart';
import 'package:e_commerce/features/ui/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.loginRoute,
          routes: {
            AppRoutes.loginRoute: (context) => LoginScreen(),
            AppRoutes.loginRoute: (context) => LoginScreen(),
          },
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
