
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF9AD983) : const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(40),
      ),
      height: 10.h,
      width: isActive ? 40.w : 20.w,
    );
  }
}