// styles.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle headerStyle = GoogleFonts.inter(
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xff323434),

  );

  static final TextStyle subTextStyle = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xff323434),
  );

  static TextStyle header = GoogleFonts.inter(
    color: const Color(0xFF323434),
    fontWeight: FontWeight.w700,
    fontSize: 32.sp,
  );

}
