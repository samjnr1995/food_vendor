import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/cusom_colours.dart';
import 'package:food_catering_service_app/screens/description_field.dart';
import 'package:food_catering_service_app/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import '../labels.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final String actionText;
  final TextStyle? textStyle;
  final TextStyle? actionStyle;
  final VoidCallback? onTap;

  const CustomRichText({
    Key? key,
    required this.text,
    required this.actionText,
    this.textStyle,
    this.actionStyle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: textStyle ??
            AppTextStyles.header.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xff323434)),
        children: [
          TextSpan(
            text: actionText,
            style: actionStyle ??
                AppTextStyles.header.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: const Color(0xFF9AD983),
                ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}

class HomeScreenFirstRow extends StatelessWidget {
  const HomeScreenFirstRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  Labels.leading,
                  height: 30,
                  width: 30,
                ),
                SizedBox(width: 20.w),
                Image.asset(
                  Labels.ellipses,
                  height: 30,
                  width: 30,
                ),
                Text(
                  Labels.dhaka,
                  style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: const Color(0xff323434),
                      fontWeight: FontWeight.w600),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.grey, size: 24.sp),
              ],
            ),
             SizedBox(
              width: 60.w,
            ),
            Image.asset(
              Labels.ping,
              width: 30,
              height: 30,
            )
          ],
        ),
      ],
    );
  }
}

class LastRowHomeScreen extends StatelessWidget {
  const LastRowHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(Labels.frameThree, height: 50, width: 50),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DescriptionScreen()));
              },
              child:
                  Image.asset(Labels.frameFour, height: 90, width: 90)),
          Image.asset(Labels.frameFive, height: 50, width: 50)
        ]);
  }
}
class ReusableRow extends StatelessWidget {
  final String? text;
  const ReusableRow({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text!,
          style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        const Icon(Icons.arrow_forward_ios)
      ],
    );
  }
}

class PopularDishWidget extends StatelessWidget {
  final String imagePath;

  const PopularDishWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(right: 16.w),
        width: 120.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class MealCategoryWidget extends StatelessWidget {
  final String label;
  final String imagePath;
  final bool isSelected;

  const MealCategoryWidget({
    Key? key,
    required this.label,
    required this.imagePath,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24.r,
          backgroundColor:
              isSelected ? AppColors.customGreen : AppColors.customWhite,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            height: 35.h,
            width: 35.w,
            color: isSelected ? AppColors.customGreen : null,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            color: isSelected ? Colors.green : Colors.black,
          ),
        ),
      ],
    );
  }
}

class HomeTextField extends StatelessWidget {
  const HomeTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 250,
          child: TextField(
            decoration: InputDecoration(
              hintStyle: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff888888)),
              hintText: Labels.search,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              fillColor: const Color(0xffF5F5F5),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Image.asset(
          Labels.btn,
          width: 70,
          height: 100,
        )
      ],
    );
  }
}
