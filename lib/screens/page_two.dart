import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/custom_clip_path.dart';
import '../components/labels.dart';
import '../components/my_widgets/custom_rich_text.dart';
import '../styles.dart';
class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Image.asset(
              Labels.gbd,
              fit: BoxFit.cover,
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -25),
            child: Padding(
              padding: const EdgeInsets.only(left: 50),
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
          Transform.translate(
            offset: Offset(0, -25),
            child: Text(
              Labels.ourJobs,
              style: AppTextStyles.subTextStyle
                  .copyWith(color: const Color(0xff888888)),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
