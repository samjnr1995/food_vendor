import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/cusom_colours.dart';
import 'package:food_catering_service_app/screens/auth/signUp/forgot_password.dart';
import 'package:food_catering_service_app/screens/auth/signUp/sign_up_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/custom_button.dart';
import '../../components/custom_field.dart';
import '../../components/labels.dart';
import '../../components/nav_bar.dart';
import '../../providers/auth_Provider.dart';


class SignIn extends StatefulWidget {
  final String? email;
  final String? password;
  const SignIn({super.key, this.email, this.password});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  // final _emailEditingController = TextEditingController();
  bool isLoading = false;
  //final _passwordEditingController = TextEditingController();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.email ?? '');
    _passwordController = TextEditingController(text: widget.password ?? '');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: SafeArea(
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
                    height: 30.h,
                  ),
                  Text(
                    'Sign In',
                    style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff000000)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(Labels.welcomeBack,
                      style: GoogleFonts.inter(
                          fontSize: 14.sp, fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 20.h,
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
                      data: _emailController,
                      val: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        loginProvider.validateEmail(value);
                      },
                      validator: (value) {
                        return loginProvider.emailError;
                      },
                      hint: Labels.password,
                      type: TextInputType.emailAddress),
                  SizedBox(
                    height: 20.h,
                  ),
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
                      data: _passwordController,
                      obs: loginProvider.passwordInvisible,
                      icon: loginProvider.passwordInvisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      click: () {
                        loginProvider.togglePasswordVisibility();
                      },
                      hint: Labels.enterYourPassword,
                      type: TextInputType.text),
                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPasswordScreen()));
                      },
                      child: Text(
                        'Forgot Password',
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.customGreen,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: Center(
                        child: CustomButton(
                          loading: isLoading,
                          color: AppColors.customGreen,
                          text: Labels.login,
                          onTap: () async {
                            final currentContext = context;
                            if (loginProvider.validateForm(
                                _emailController.text, _passwordController.text)) {
                              SharedPreferences pref =
                              await SharedPreferences.getInstance();
                              await pref.setString("email", _emailController.text);
                              await pref.setString(
                                  "password", _passwordController.text);
                              if (currentContext.mounted) {
                                Navigator.push(
                                  currentContext,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      )),
                  SizedBox(
                    height: 15.h,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/faceID.png',
                      height: 70.h,
                      width: 70.w,
                    ),
                  ),
                  SizedBox(height: 60.h),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: const Color(0xff000000)),
                        ),
                        SizedBox(
                          width: 4.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: Text(
                            Labels.signUp,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: AppColors.customGreen),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
