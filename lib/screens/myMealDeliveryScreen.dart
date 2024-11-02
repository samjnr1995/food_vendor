import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/cusom_colours.dart';
import 'package:food_catering_service_app/components/my_widgets/custom_rich_text.dart';
import 'package:food_catering_service_app/screens/profile_screen.dart';
import 'package:food_catering_service_app/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/container.dart';
import '../components/labels.dart';

class MyMealDelivery extends StatelessWidget {
  const MyMealDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomRichText(
          textStyle: AppTextStyles.headerStyle
              .copyWith(fontWeight: FontWeight.w700, fontSize: 26),
          text: Labels.good,
          actionText: Labels.rehan,
          actionStyle: AppTextStyles.headerStyle.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppColors.customGreen),
        ),
        Text(
          Labels.todayMeal,
          style: GoogleFonts.inter(
            fontSize: 16.w,
            fontWeight: FontWeight.w400,
            color: const Color(0xff888888),
          ),
        ),
        SizedBox(height: 15.h),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const MyMealContainer(
                    color: AppColors.customGreen,
                  ),
                  SizedBox(width: 8.w),
                  const MyMealContainer(
                    color: AppColors.customGreen,
                  ),
                  const MyMealContainer(color: AppColors.customWhite),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const DateContainer(),
              const SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  Labels.imageTwenty,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                Labels.chicken,
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF323434),
                ),
              ),
              Text(
                Labels.stuffed,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF888888),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              const ContainerWidget(
                text: Labels.five,
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    Labels.next,
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF323434),
                    ),
                  ),
                  SizedBox(width: 45.sp),
                  Text(Labels.twenty,
                      style: GoogleFonts.inter(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF323434),
                      ))
                ],
              ),
              SizedBox(height: 20,),
              const HomeScreenContainer(),
            ],
          ),
        )
      ],
    );
  }
}

class DateContainer extends StatelessWidget {
  const DateContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Labels.preparing,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: AppColors.customGreen, // Status color
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              Labels.yourMeal,
              style: GoogleFonts.inter(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF323434),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              Labels.unable,
              style: GoogleFonts.inter(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF888888),
              ),
            ),
          ],
        ),
        SizedBox(width: 25,),
        _buildDateBox(Labels.mon, Labels.twentyFour),
      ],
    );
  }
}

class MyMealContainer extends StatelessWidget {
  final Color color;
  const MyMealContainer({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width: 97.w,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
    );
  }
}

Widget _buildDateBox(String day, String date) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: Colors.green),
    ),
    child: Column(
      children: [
        Text(
          day,
          style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.green),
        ),
        Text(
          date,
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.green,
          ),
        ),
      ],
    ),
  );
}
