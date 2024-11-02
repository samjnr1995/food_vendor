import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/container.dart';
import 'package:food_catering_service_app/components/cusom_colours.dart';
import 'package:food_catering_service_app/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/custom_button.dart';
import '../models/counter_provider.dart';

class CartTwoScreen extends StatelessWidget {
  const CartTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(375, 812), minTextAdapt: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Checkout',
          style: GoogleFonts.inter(
            fontSize: 22.sp,
            color: const Color(0xff323434),
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/img-3.png',
                    height: 110,
                    width: 110,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DeleteContainer(),
                  Container(
                    width: 35,
                    height: 140,
                    decoration: BoxDecoration(
                        color: Color(0xffFF8989),
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.delete,
                      color: AppColors.customWhite,
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Image.asset(
                'assets/img-2.png',
                height: 110,
                width: 110,
              ),
              const DeleteContainer(
                minus: '1',
                title: 'Sahi Polao and Korma Deshi ',
                subTitle: 'Cuisine',
                subTitleTwo: 'Chicken Fried with Khichuri',
                padding: EdgeInsets.only(left: 120),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class DeleteContainer extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final EdgeInsetsGeometry? padding;
  final String? minus;
  final String? subTitle;
  final String? subTitleTwo;
  const DeleteContainer({
    super.key,
    this.icon,
    this.title,
    this.subTitle,
    this.subTitleTwo,
    this.minus,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? 'Mexican Vegetables',
              style: AppTextStyles.subTextStyle.copyWith(
                  color: AppColors.customBlack,
                  fontSize: 13,
                  fontWeight: FontWeight.w600)),
          Text(subTitle ?? ' and Salad',
              style: AppTextStyles.subTextStyle.copyWith(
                  color: AppColors.customBlack,
                  fontSize: 13,
                  fontWeight: FontWeight.w600)),

          // Text('and Salad',
          //     style: AppTextStyles.subTextStyle.copyWith(
          //         fontSize: 13, fontWeight: FontWeight.w600)),
          const SizedBox(
            height: 7,
          ),
          Text(subTitleTwo ?? 'Chicken Fried with Khichuri',
              style: AppTextStyles.subTextStyle.copyWith(
                  color: Color(0xff888888),
                  fontSize: 11,
                  fontWeight: FontWeight.w400)),
          const SizedBox(
            height: 11,
          ),
          Padding(
            padding: padding ?? const EdgeInsets.only(left: 40),
            child: PlusMinusContainer(
            ),
          )
        ],
      ),
    );
  }
}
