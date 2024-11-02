import 'package:flutter/material.dart';
import 'package:food_catering_service_app/components/cusom_colours.dart';
import 'package:food_catering_service_app/components/custom_button.dart';
import 'package:food_catering_service_app/screens/auth/login_screen.dart';
import 'package:food_catering_service_app/screens/page_one.dart';
import 'package:food_catering_service_app/screens/page_three.dart';
import 'package:food_catering_service_app/screens/page_two.dart';
import '../components/labels.dart';

class GetStarted extends StatefulWidget {

  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;
  final List<Widget> _pages = [
    const PageOne(),
    const PageTwo(),
    const PageThree()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              PageView.builder(

                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _activePage = page;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _pages[index % _pages.length];
                },
              ),

              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                height: 100,
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                        _pages.length,
                            (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () {
                              _pageController.animateToPage(index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                              height: 10,width: 30,
                              decoration: BoxDecoration(
                                  color: _activePage == index
                                      ? AppColors.customGreen
                                      : AppColors.customWhite,
                                  borderRadius: BorderRadius.circular(10)

                              ),


                            ),
                          ),
                        )),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: CustomButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignIn()));
                  },
                  text: Labels.getStarted,
                  textColor: const Color(0xFFFFFFFF),
                  color: const Color(0xFF9AD983),
                  width: 600,
                ),
              ),
            ],
          ),
        ));




  }
}
