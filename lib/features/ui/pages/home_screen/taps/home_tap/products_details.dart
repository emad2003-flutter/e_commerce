import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsetsGeometry.only(left: 16.w, right: 16.w),
        child: SingleChildScrollView(child: Container()),
      ),
    );
  }
}
