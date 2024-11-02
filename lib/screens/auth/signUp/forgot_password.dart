
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/screens/auth/signUp/pin_code_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/cusom_colours.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_field.dart';
import '../../../components/labels.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ForgotPasswordScreenState createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Back Arrow
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  // Handle back button
                },
              ),
              const SizedBox(height: 20),

              // Title and instruction
              Text(
                'Forgot Password',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.customGreen),
              ),
              SizedBox(height: 10.h),
              Text(
                'Please enter your email address',
                textAlign: TextAlign.left,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color(0xff000000)),
              ),
               SizedBox(height: 20.h),

              // Pin code field for entering the OTP
              Text(
                'Email Address',
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
                    value = _emailEditingController.text;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return Labels.emailRequired;
                    } else if (!RegExp(Labels.emailRex)
                        .hasMatch(value)) {
                      return Labels.invalidEmail;
                    }
                    return null;
                  },
                  hint: 'Enter your email', type: TextInputType.emailAddress),
              const SizedBox(height: 20),
              CustomButton(
                  color: AppColors.customGreen,
                  text: 'Reset Password',
                  onTap: () {
                    if(_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OtpScreen()));
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
