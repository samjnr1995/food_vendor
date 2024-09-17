import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/my_widgets/custom_rich_text.dart';
import 'package:food_catering_service_app/screens/home_screen.dart';
import 'package:food_catering_service_app/screens/sign_up_screen.dart';
import 'package:food_catering_service_app/styles.dart';
import '../components/custom_button.dart';
import '../components/custom_field.dart';
import '../components/labels.dart';
import '../components/reusable_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const ImageFlipContainer(image: Labels.pic,),
                const SizedBox(
                  height: 10,
                ),
                Text(Labels.login, style: AppTextStyles.header),
                SizedBox(
                  height: 30.h,
                ),
                Text(Labels.emailAddress,
                    style: AppTextStyles.headerStyle.copyWith(
                        fontSize: 16.sp, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 10.h,
                ),
                const CustomField(
                  hint: Labels.typeYourEmail,
                  fillColor: Color(0xffF5F5F5),
                  type: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(Labels.password,
                    style: AppTextStyles.headerStyle.copyWith(
                        fontSize: 16.sp, fontWeight: FontWeight.w500)),
                const CustomField(
                  hint: Labels.typeYourPassword,
                  type: TextInputType.text,
                  color: Color(0xFFA9A9A9),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                    child: CustomButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  text: Labels.login,
                  textColor: const Color(0xFFFFFFFF),
                  color: const Color(0xFF9AD983),
                  width: 600,
                )),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(
                    Labels.loginWith,
                    style: AppTextStyles.subTextStyle.copyWith(
                      fontSize: 14
                    )
                  ),
                ),
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
                const SizedBox(
                  height: 70,
                ),
                Center(
                  child: CustomRichText(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUp()));
                      },
                      text: Labels.havnt,
                      actionText: Labels.registerNow),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
