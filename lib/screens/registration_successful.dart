import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/cusom_colours.dart';
import 'package:food_catering_service_app/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cart_screen.dart';

class RegistrationSuccessDialog extends StatelessWidget {
  const RegistrationSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Success icon
            Container(
                width: 80.w,
                height: 80.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.customGreen,
                ),
                child: Image.asset("assets/Icon.png")),
            SizedBox(height: 20.h),
            // 'You're good to go!' text
            Text(
              "You're good to go!",
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.customGreen,
              ),
            ),
            SizedBox(height: 10.h),
            // 'Congratulations...' text
            Text(
              'Congratulations, your items has been successfully added to cart.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff16171C),
              ),
            ),
            SizedBox(height: 20.h),
            // Sign In button
            ElevButton(
              text: 'Go to cart',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartDetails()));
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            ElevButton(
              text: 'Home page',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ElevButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const ElevButton({
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.customGreen, // Button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// Function to show the dialog
void showRegistrationSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const RegistrationSuccessDialog();
    },
  );
}
