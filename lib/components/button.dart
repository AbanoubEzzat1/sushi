import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sushi/themes/colors.dart';

class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: ColorsManger.secondaryColor,
            borderRadius: BorderRadius.circular(40.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(width: 10.w),
              const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
