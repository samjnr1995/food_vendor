import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/nav_bar.dart';
import 'package:food_catering_service_app/providers/auth_Provider.dart';
import 'package:food_catering_service_app/providers/cart_model_provider.dart';
import 'package:food_catering_service_app/providers/product_provider.dart';
import 'package:food_catering_service_app/providers/snacks_provider.dart';
import 'package:food_catering_service_app/screens/home_screen.dart';
import 'package:food_catering_service_app/screens/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/counter_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SnacksProvider()),
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => CartModelProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider())
      ],
      child: MyApp(
        email: email,
      )));
}

class MyApp extends StatelessWidget {
  final String? email;
  const MyApp({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage()),
    );
  }
}
