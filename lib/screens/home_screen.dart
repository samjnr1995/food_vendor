import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/cusom_colours.dart';
import 'package:food_catering_service_app/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/container.dart';
import '../components/labels.dart';
import '../components/my_widgets/custom_rich_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(375, 812), minTextAdapt: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35.h),
              const HomeScreenFirstRow(),
              SizedBox(height: 16.h),
              CustomRichText(
                textStyle: AppTextStyles.headerStyle.copyWith(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.customBlack),
                text: Labels.good,
                actionText: Labels.rehan,
                actionStyle: AppTextStyles.headerStyle.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.customGreen),
              ),
              SizedBox(height: 4.h),
              Text(
                Labels.choose,
                style: AppTextStyles.subTextStyle.copyWith(color: const Color(0xff888888)),
              ),
              SizedBox(height: 16.h),
              const HomeTextField(),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Labels.serving,
                      style: AppTextStyles.subTextStyle.copyWith(color: AppColors.customBlack)),
                  Text(
                    Labels.days,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: const Color(0xff9AD983),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              const HomeScreenContainer(),
              SizedBox(height: 16.h),
              Text(
                Labels.todayMealDate,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  color: const Color(0xff323434),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MealCategoryWidget(label: Labels.snacks, imagePath: Labels.lunchImage),
                  MealCategoryWidget(label: Labels.breakfast, imagePath: Labels.breakfastImage),
                  MealCategoryWidget(label: Labels.lunch, imagePath: Labels.dinnerImage),
                  MealCategoryWidget(label: Labels.dinner, imagePath: Labels.dinnerImage,
                  ) ],
              ),
              SizedBox(height: 16.h),
              const PopularWidget(),
              SizedBox(height: 16.h),
              Center(
                child: SizedBox(
                  height: 120.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Image.asset(Labels.popularDish,height: 150,width: 150,),
                      Image.asset(Labels.popularDishImage,width: 150,height: 150,)
                    ],
                  )
                ),
              ),
              const LastRowHomeScreen(),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ContainerWidget(text: Labels.four),
                    DetailButton(
                      iconPath: Labels.frame5,
                      text: Labels.kal,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
