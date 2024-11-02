import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/cusom_colours.dart';
import 'package:food_catering_service_app/components/nav_bar.dart';
import 'package:food_catering_service_app/screens/auth/signUp/pin_code_screen.dart';
import 'package:food_catering_service_app/screens/checkout.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_field.dart';
import '../../../components/labels.dart';
import '../../../components/my_widgets/phone_field.dart';
import '../../../providers/auth_Provider.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController firstNameEditingController,
    required this.loginProvider,
    required TextEditingController lastNameEditingController,
    required TextEditingController emailEditingController,
    required TextEditingController passwordEditingController,
    required String? selectedAccountType,
  })  : _formKey = formKey,
        _firstNameEditingController = firstNameEditingController,
        _lastNameEditingController = lastNameEditingController,
        _emailEditingController = emailEditingController,
        _passwordEditingController = passwordEditingController,
        _selectedAccountType = selectedAccountType;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _firstNameEditingController;
  final LoginProvider loginProvider;
  final TextEditingController _lastNameEditingController;
  final TextEditingController _emailEditingController;
  final TextEditingController _passwordEditingController;
  final String? _selectedAccountType;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
                child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  const Icon(Icons.arrow_back_ios),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    Labels.signUp,
                    style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.customGreen),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(Labels.createAnAccount,
                      style: GoogleFonts.inter(
                          fontSize: 14.sp, fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    Labels.firstName,
                    style: GoogleFonts.inter(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff353535)),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomField(
                      data: _firstNameEditingController,
                      val: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        loginProvider.validateName(value);
                      },
                      validator: (value) {
                        return loginProvider.firstNameError;
                      },
                      hint: Labels.firstName,
                      type: TextInputType.name),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    Labels.lastName,
                    style: GoogleFonts.inter(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff353535)),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomField(
                      data: _lastNameEditingController,
                      val: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        loginProvider.validateLastName(value);
                      },
                      validator: (value) {
                        return loginProvider.lastNameError;
                      },
                      hint: Labels.lastName,
                      type: TextInputType.name),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    Labels.emailAddress,
                    style: GoogleFonts.inter(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff353535)),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomField(
                      data: _emailEditingController,
                      val: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        loginProvider.validateEmail(value);
                      },
                      validator: (value) {
                        return loginProvider.emailError;
                      },
                      hint: Labels.emailAddress,
                      type: TextInputType.emailAddress),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    Labels.phoneNumber,
                    style: GoogleFonts.inter(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff353535)),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  const IntlPhoneNumber(),
                  Text(
                    Labels.password,
                    style: GoogleFonts.inter(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff353535)),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomField(
                      val: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return loginProvider.passwordError;
                      },
                      onChanged: (value) {
                        loginProvider.validatePassword(value);
                      },
                      data: _passwordEditingController,
                      obs: !loginProvider.passwordInvisible,
                      icon: loginProvider.passwordInvisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      click: () {
                        loginProvider.togglePasswordVisibility();
                      },
                      hint: Labels.password,
                      type: TextInputType.text),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Account type',
                    style: GoogleFonts.inter(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff353535)),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      loginProvider.showAccountTypeBottomSheet(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 12.h),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.customGreen, width: 1.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedAccountType ?? Labels.selectAccountType,
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff353535),
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.customGreen,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    Labels.howDidYouHear,
                    style: GoogleFonts.inter(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff353535)),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  const CustomField(
                      icon: Icons.keyboard_arrow_down,
                      hint: Labels.howDidYouHear,
                      type: TextInputType.text),
                  Row(
                    children: [
                      Checkbox(
                        side: BorderSide.none,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (loginProvider.termsAccepted) {
                              return AppColors.customGreen;
                            }
                            return const Color(0xffEAECF0);
                          },
                        ),
                        focusColor: const Color(0xffF2F4F7),
                        value: loginProvider.termsAccepted,
                        onChanged: (value) {
                          loginProvider.toggleTermsAccepted();
                        },
                      ),
                      Expanded(
                          child: Text(
                        Labels.agree,
                        style: GoogleFonts.inter(
                            color: const Color(0xff000000),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400),
                      ))
                    ],
                  ),
                  Center(
                      child: CustomButton(
                          color: AppColors.customGreen,
                          text: Labels.signUp,
                          onTap: () {
                            if (loginProvider.validateSignUpForm(
                              _emailEditingController.text,
                              _passwordEditingController.text,
                              _firstNameEditingController.text,
                            )) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CheckOutScreen()));
                            }
                          })),
                  SizedBox(
                    height: 15.h,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Labels.alreadyHave,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: const Color(0xff000000)),
                        ),
                        SizedBox(
                          width: 4.h,
                        ),
                        Text(
                          'Sign in',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: AppColors.customGreen),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ))));
  }
}
