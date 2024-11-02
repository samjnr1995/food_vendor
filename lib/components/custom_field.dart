import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_catering_service_app/components/cusom_colours.dart';
class CustomField extends StatelessWidget {
  final String hint;
  final AutovalidateMode? val;
  final String? actualHint;
  final Color? textColor;
  final bool isMap;
  final Color? fillColor;  // Fill color for the text field
  final bool isDisabled;
  final bool readOnly;
  final IconData? icon;
  final IconData? preIcon;
  final int? maxlines;
  final int? maxlength;
  final Function()? click;
  final Color? color;
  final TextEditingController? data;
  final TextInputType type;
  final bool obs;
  final String? Function(String?)? validator;
  final Function(String)? submit;
  final Function(String)? onChanged;
  final TextCapitalization? tc;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  const CustomField({
    Key? key,
    required this.hint,
    this.fillColor,
    this.color,
    required this.type,
    this.preIcon,
    this.actualHint,
    this.val,
    this.onChanged,
    this.icon,
    this.readOnly = false,
    this.maxlines,
    this.maxlength,
    this.click,
    this.textColor,
    this.data,
    this.validator,
    this.submit,
    this.tc,
    this.isMap = false,
    this.isDisabled = false,
    this.obs = false,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        readOnly: readOnly,
        autovalidateMode: val,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        maxLength: maxlength,
        enabled: !isDisabled,
        onFieldSubmitted: submit,
        textCapitalization: tc ?? TextCapitalization.none,
        validator: validator,
        onChanged: onChanged,
        obscureText: obs,
        keyboardType: type,
        controller: data,
        maxLines: maxlines ?? 1,
        cursorColor: Colors.grey,
        style: const TextStyle(
            fontFamily: 'Inter', fontSize: 14, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          fillColor: fillColor ?? Colors.white, // Fill color applied here
          filled: true, // Set this to true to make the fill color visible
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          hintText: actualHint ?? hint,
          alignLabelWithHint: true,
          hintStyle: const TextStyle(color: Color(0xff888888), fontWeight: FontWeight.w400, fontSize: 14),

          // Focused border with white background
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.customWhite,
              width: 1.5,
            ),
          ),
          // Enabled border
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5),
              width: 1.5,
            ),
          ),
          // Disabled border
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(.3),
              width: 1.5,
            ),
          ),
          // Focused border
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.customGreen,
              width: 1.5,
            ),
          ),
          // Error border
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1.5,
            ),
          ),
          errorStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            color: Colors.red,
          ),
          // Suffix and prefix icon handling
          suffixIconConstraints: const BoxConstraints(
            minWidth: 35,
            minHeight: 30,
          ),
          prefixIcon: preIcon == null
              ? null
              : Icon(
            preIcon,
            color: Color(0xff888888),
            size: 30,
          ),
          suffixIcon: IconButton(
            onPressed: click,
            icon: Icon(
              icon,
              size: 18,
              color:  Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
