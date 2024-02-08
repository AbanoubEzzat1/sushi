import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 25.0.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "sushi man".toUpperCase(),
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 28.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 40.0.w, vertical: 40.0.h),
                  child: Image.asset("assets/images/sushi.png"),
                ),
                SizedBox(height: 20.h),
                Text(
                  "the taste of japanese food".toUpperCase(),
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 44.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                    "Feel the taste of the most popular Japanese food from anywhere and anytime",
                    style: TextStyle(color: Colors.grey[300], height: 2.h)),
                SizedBox(height: 20.h),
                MyButton(
                    text: "GET STARTED".toUpperCase(),
                    onTap: () {
                      Navigator.pushNamed(context, '/menuePage');
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
