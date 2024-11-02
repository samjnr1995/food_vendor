import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/providers/cart_model_provider.dart';
import 'package:food_catering_service_app/screens/second_checkout_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/counter_provider.dart';
import 'cusom_colours.dart';
import 'labels.dart';

class ContainerWidget extends StatelessWidget {
  final String? text;

  const ContainerWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const DetailButton(
            iconPath: Labels.frame3,
            text: Labels.four,
          ),
          const SizedBox(width: 20), // Spacing between buttons
          const DetailButton(
            iconPath: Labels.frame5,
            text: Labels.kal,
          ),
          const SizedBox(width: 20), // Spacing between buttons
          DetailButton(
            iconPath: 'assets/time.png',
            text: text!,
          ),
        ],
      ),
    );
  }
}
class LastContainerCheckout extends StatelessWidget {
  const LastContainerCheckout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFFFFFF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                color: const Color(0xffFFFFFF),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.grey,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 8.w),
              Consumer<CartModelProvider>(
                builder: ( context, cartProvider , child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Labels.total,
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: const Color(0xff9AD983),
                        ),
                      ),
                      Text(
                      '\$${cartProvider.totalPrice.toStringAsFixed(2)}',
                        style: GoogleFonts.inter(
                          color: const Color(0xff323434),
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const SecondCheckoutScreen()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color(0xff9AD983)),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(
                    horizontal: 16.w, vertical: 8.h),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.r),
                ),
              ),
            ),
            child: Text(
              Labels.proceed,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.customWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class DateSectionCheckOut extends StatelessWidget {
  const DateSectionCheckOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 60,
          width: 120,
          decoration: BoxDecoration(
              color: const Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(15)),
          child:  const Center(child: Text(Labels.date)),
        ),
        const SizedBox(
          width: 40,
        ),
        Container(
          height: 60,
          width: 120,
          decoration: BoxDecoration(
              color: const Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(15)),
          child:  const Center(child: Text(Labels.list)),
        ),
      ],
    );
  }
}


class PlansContainer extends StatelessWidget {
  const PlansContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      color: const Color(0xff9AD983),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween,
        children: [
          // Text Column
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                Labels.weeklyPlan,
                style: TextStyle(
                  fontSize:
                  18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                Labels.sevenDays,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          // Price and Icon Column
          Column(
            crossAxisAlignment: CrossAxisAlignment
                .end,
            children: [
              Image.asset(Labels.linkImage, height: 40,width: 40,),
              Text(
                Labels.perWeek,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),const SizedBox(height: 4),
              Text(
                Labels.twoK,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

            ],
          ),
        ],
      ),
    );
  }
}


class DetailButton extends StatelessWidget {
  final String iconPath;
  final String text;

  const DetailButton({
    super.key,
    required this.iconPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8), // Add padding for content
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.asset(iconPath,height: 20,width: 20,), // Reusable image asset
          const SizedBox(width: 5),
          Text(
            text, // Reusable text
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff323434)),
          ),
        ],
      ),
    );
  }
}

class PlusMinusContainer extends StatelessWidget {
  final double? wid;
  final double? widt;
  final double? hei;
  final double? height;

  const PlusMinusContainer({
    super.key,
    this.height,
    this.wid,
    this.hei,
    this.widt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hei ?? 35,
      width: widt ?? 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Border radius
        color: const Color(0xFF9AD983),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => context.read<CounterProvider>().decrement(),
              child: Container(
                height: height ?? 20,
                width: wid ?? 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
                child: const Icon(
                  Icons.remove,
                  color: Color(0xFF9AD983),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Consumer<CounterProvider>(
              builder: (context, provider, _) => Text(
                '${provider.count}',
                style: GoogleFonts.inter(
                  color: const Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w700,
                  fontSize: 28.sp,
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => context.read<CounterProvider>().increment(),
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
                child: const Icon(Icons.add, color: Color(0xFF9AD983)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenContainer extends StatelessWidget {
  const HomeScreenContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.customWhite,
      height: 50.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(7, (index) {
          return Container(
            width: 48.w,
            margin: EdgeInsets.only(right: 8.w),
            decoration: BoxDecoration(
              color: index == 2
                  ? const Color(0xff9AD983)
                  : const Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  [
                    'SUN',
                    'MON',
                    'TUE',
                    'WED',
                    'THU',
                    'FRI',
                    'SAT'
                  ][index],
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: index == 2 ? AppColors.customBlack : AppColors.customBlack,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '${24 + index}',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: index == 2 ? Colors.green : Colors.black,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
        decoration: BoxDecoration(
            color: const Color(0xFF9AD983),
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(15), // Background color
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi Rehan",
                  style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  "rehanurraihan@gmail.com",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                )
              ],
            ),
             SizedBox(
              width: 35.w,
            ),
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/AVATAR.png',),
            ),
          ],
        ));
  }
}

class PopularWidget extends StatelessWidget {
  const PopularWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Labels.popular,
          style: GoogleFonts.inter(
            color: const Color(0xff323434),
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          Labels.seeAll,
          style: GoogleFonts.inter(
            decoration: TextDecoration.underline,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xff888888),
          ),
        ),
      ],
    );
  }
}
