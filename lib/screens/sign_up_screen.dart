import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/cusom_colours.dart';
import 'package:food_catering_service_app/components/my_widgets/custom_rich_text.dart';
import 'package:food_catering_service_app/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/custom_button.dart';
import '../components/custom_field.dart';
import '../components/labels.dart';
import '../components/reusable_container.dart';
import '../styles.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ImageFlipContainer(
                  image: Labels.sign,
                ),
                SizedBox(height: 20.h),
                Text(Labels.signUp, style: AppTextStyles.header),
                SizedBox(height: 10.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipWidget(
                      wid: 50,
                      hei: 50,
                      image: Labels.google,
                    ),
                    ClipWidget(
                      image: Labels.facebook,
                      wid: 70,
                      hei: 70,
                    ),
                    ClipWidget(
                      image: Labels.apple,
                      wid: 70,
                      hei: 70,
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    Labels.registerWithEmail,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400, fontSize: 12.sp),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(Labels.fullName,
                    style: AppTextStyles.headerStyle.copyWith(
                        fontSize: 16.sp, fontWeight: FontWeight.w500)),
                SizedBox(height: 10.h),
                const CustomField(
                    fillColor: AppColors.customWhite,
                    hint: Labels.typeYourName,
                    isMap: true,
                    type: TextInputType.text),
                SizedBox(height: 10.h),
                Text(Labels.emailAddress,
                    style: AppTextStyles.headerStyle.copyWith(
                        fontSize: 16.sp, fontWeight: FontWeight.w500)),
                SizedBox(height: 10.h),
                const CustomField(
                    fillColor: AppColors.customWhite,
                    hint: Labels.typeYourEmail,
                    isMap: true,
                    type: TextInputType.emailAddress),
                SizedBox(height: 10.h),
                Text(Labels.password,
                    style: AppTextStyles.headerStyle.copyWith(
                        fontSize: 16.sp, fontWeight: FontWeight.w500)),
                SizedBox(height: 10.h),
                const CustomField(
                  fillColor: AppColors.customWhite,
                  hint: Labels.typeYourPassword,
                  type: TextInputType.text,
                  color: Color(0xFFA9A9A9),
                ),
                SizedBox(height: 10.h),
                Center(
                    child: CustomButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  text: Labels.signUp,
                  textColor: const Color(0xFFFFFFFF),
                  color:  AppColors.customGreen,
                  width: 600,
                )),
                SizedBox(height: 20.h),
                const CustomRichText(
                    text: Labels.alreadyHaveAccount, actionText: Labels.login)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
