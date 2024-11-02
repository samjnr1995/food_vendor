import 'package:flutter/material.dart';
import 'package:food_catering_service_app/screens/home_screen.dart';
import 'package:food_catering_service_app/screens/plans.dart';
import '../screens/profile_screen.dart';
import 'cusom_colours.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int pageIndex = 0;


  final List<Widget> pages = [
    const HomeScreen(),
    const PlansScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  BottomNavigationBar buildMyNavBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: pageIndex,
      onTap: (index) {
        setState(() {
          pageIndex = index;
        });
      },
      backgroundColor: const Color(0xffFFFFFF),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.customGreen,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home)
        ),
        BottomNavigationBarItem(
          label: 'Menu',
          icon: Icon(Icons.menu)
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.person)
        ),
      ],
    );
  }
}
