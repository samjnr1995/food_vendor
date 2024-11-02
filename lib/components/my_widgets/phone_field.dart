
import 'package:flutter/material.dart';
import 'package:food_catering_service_app/components/cusom_colours.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../styles.dart';
class IntlPhoneNumber extends StatelessWidget {
  const IntlPhoneNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      pickerDialogStyle: PickerDialogStyle(
          countryCodeStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w400),
          countryNameStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w400),
          backgroundColor: Colors.white),
      dropdownTextStyle: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w400),
      style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w400),
      cursorColor: AppColors.customGreen,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
            vertical: 18, horizontal: 10),
        alignLabelWithHint: true,
        hintStyle: const TextStyle(
          color: Color(0xff888888),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.customGreen,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(.3),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.customGreen,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.5,
          ),
        ),
        errorStyle: AppTextStyles.subTextStyle.copyWith(
          fontWeight: FontWeight.normal,
          color: const Color(0xffC30A3B),
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 35,
          minHeight: 30,
        ),
      ),
      dropdownIconPosition: IconPosition.trailing,
      initialCountryCode: 'NG',
      onChanged: (phone) {
        //print(phone.completeNumber);
      },
      onCountryChanged: (country) {
        //print('Country changed to: ${country.name}');
      },
    );
  }
}
