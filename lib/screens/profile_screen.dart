import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/container.dart';
import '../components/cusom_colours.dart';
import '../components/custom_button.dart';
import '../components/labels.dart';
import '../components/my_widgets/custom_rich_text.dart';
import '../screens/catering_menu.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isNotificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: Text(
          Labels.profile,
          style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const ProfileContainer(),
              SizedBox(height: 25.h),
              const ReusableRow(text: Labels.profileInfo),
              SizedBox(height: 25.h),
              const ReusableRow(text: Labels.orderHistory),
              SizedBox(height: 25.h),
              const ReusableRow(text: Labels.location),
              SizedBox(height: 25.h),
              const ReusableRow(text: Labels.paymentMethod),
              SizedBox(height: 25.h),
              const ReusableRow(text: Labels.gift),
              SizedBox(height: 25.h),
              const ReusableRow(text: Labels.refer),
              SizedBox(height: 25.h),
              NotificationContainer(
                title: 'Push Notification',
                sizedBox: 60,
                isToggled: _isNotificationEnabled,
                onToggle: (value) {
                  setState(() {
                    _isNotificationEnabled = value;
                  });
                },
              ),
              const SizedBox(height: 25),
              const ReusableRow(text: Labels.contact),
              const SizedBox(height: 25),
              const ReusableRow(text: Labels.logout),

            ],
          ),
        ),
      ),
    );
  }
}

class NotificationContainer extends StatelessWidget {
  final String title;
  final double sizedBox;
  final bool isToggled;
  final ValueChanged<bool> onToggle;

  const NotificationContainer({
    super.key,
    required this.title,
    required this.sizedBox,
    required this.isToggled,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500, fontSize: 16)),
            ],
          ),
          SizedBox(
            width: sizedBox,
          ),
          GestureDetector(
            onTap: () {
              onToggle(!isToggled); // Toggle the state when tapped
            },
            child: Icon(
              isToggled ? Icons.toggle_on : Icons.toggle_off,
              size: 50,
              color: isToggled ? AppColors.customGreen : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
