import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Color? textColor;
  final String? text;
  final bool loading;
  final Color? color;
  final TextStyle? style;
  final double? width;
  final Function() onTap;

  const CustomButton({
    this.loading = false,
    this.color,
    this.width,
    this.style,
    required this.onTap,
    this.text = 'Submit',
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 60.sp,
        width: 600.sp,
        child: (loading)
            ? const SizedBox(
          height: 30,
          width: 30,
          child: Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        )
            : Text(
          text!,
          style: style ?? GoogleFonts.nunitoSans(
            color: textColor ?? Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
