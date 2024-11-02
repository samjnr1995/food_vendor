import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/screens/cart_two.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/custom_button.dart';

class SecondCheckoutScreen extends StatelessWidget {
  const SecondCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812), minTextAdapt: true);

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Summary',
                    style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff323434)),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal',
                          style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff323434))),
                      Text('2000', style: GoogleFonts.inter(fontSize: 12.sp)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery',
                          style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff323434))),
                      Text('0',
                          style: GoogleFonts.inter(
                              color: const Color(0xff323434),
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: GoogleFonts.inter(
                          color: const Color(0xff323434),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '2000',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: const Color(0xff323434),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment',
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              color: const Color(0xff323434),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '**** **** **** 9111',
                            style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                color: const Color(0xff323434),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Color(0xff323434)),
                        onPressed: () {},
                      ),
                      Text(
                        '05/25',
                        style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff323434)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Color(0xff323434)),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping address',
                            style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff323434)),
                          ),
                          Text(
                            'Rd 12, A Block, Dhanmondi, \nBangladesh',
                            style: GoogleFonts.roboto(
                                fontSize: 14.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Color(0xff323434)),
                        onPressed: () {},
                      ),
                      Text(
                        '05/25',
                        style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff323434)),
                      ),


                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 170,),
            Center(
                child: CustomButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartTwoScreen()));
                  },
                  text: "Confirm & Continue",
                  textColor: const Color(0xFFFFFFFF),
                  color: const Color(0xFF9AD983),
                  width: 600,
                )
            ),
          ],
        ),
      ),
    );
  }
}
