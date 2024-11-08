import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/my_widgets/custom_rich_text.dart';
import 'package:food_catering_service_app/screens/my_meal.dart';
import 'package:food_catering_service_app/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/labels.dart';

class IngredientScreen extends StatelessWidget {
  String ingredient;
  IngredientScreen({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          Labels.about,
          style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff888888)),
        ),
        CustomRichText(
          textStyle: AppTextStyles.subTextStyle.copyWith(fontWeight: FontWeight.w400,fontSize: 14),
          text: ingredient,
          actionText: Labels.readMore,
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
