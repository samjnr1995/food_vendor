import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/custom_button.dart';
import 'package:food_catering_service_app/components/my_widgets/custom_rich_text.dart';
import 'package:food_catering_service_app/screens/login_screen.dart';
import 'package:food_catering_service_app/styles.dart';

import '../components/container_indicator.dart';
import '../components/custom_clip_path.dart';
import '../components/labels.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Image.asset(
                  Labels.gbd,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: CustomRichText(
                          textStyle: AppTextStyles.headerStyle
                              .copyWith(color: const Color(0xff323434)),
                          text: Labels.theFastest,
                          actionText: Labels.food,
                          actionStyle: AppTextStyles.headerStyle.copyWith(
                            color: const Color(0xFF9AD983),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      Labels.ourJobs,
                      style: AppTextStyles.subTextStyle
                          .copyWith(color: const Color(0xff888888)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Indicator(isActive: true),
                          SizedBox(width: 4),
                          Indicator(isActive: false),
                          SizedBox(width: 4),
                          Indicator(isActive: false),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      text: Labels.getStarted,
                      textColor: const Color(0xFFFFFFFF),
                      color: const Color(0xFF9AD983),
                      width: 600,
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
