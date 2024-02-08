import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sushi/pages/cart_page.dart';
import 'package:sushi/pages/intro_oage.dart';
import 'package:sushi/pages/menue_page.dart';

class Sushi extends StatelessWidget {
  const Sushi({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SUSHI',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const IntroPage(),
        routes: {
          '/introPage': (context) => const IntroPage(),
          '/menuePage': (context) => const MenuPage(),
          '/cartPage': (context) => const CartPage(),
        },
      ),
    );
  }
}
