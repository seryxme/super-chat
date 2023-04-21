import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'controller.dart';

class LoginPage extends GetView<LoginController>  {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildLogo() {
      return Container(
        width: 110.w,
        margin: EdgeInsets.only(top: 84.h),
        child: Column(
          children: [
            Container(
              width: 76.w,
              height: 76.w,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 76.w,
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent,
                        boxShadow: const [
                          BoxShadow(),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(35.w)),
                      ),
                    ),
                ),
                  Positioned(
                    child: Image.asset(
                      "assets/images/logo-transp.png",
                      width: 76.w,
                      height: 76.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 15.h,
                  bottom: 15.h
              ),
              child: Text(
                  'Get Zinging',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  height: 1,
                ),
              ),
            )
          ],
        ),
      );
    }
    Widget _buildThirdPartyLogin() {
      return Container(
        width: 295.w,
        margin: EdgeInsets.only(top: 280.w),
        child: Column(
          children: [
            Text(
                "Sign in with your social media account",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: 30.h,
                    left: 50.w,
                    right: 50.w
                ),
              child: FilledButton(
                onPressed: () {
                  controller.handleSignIn();
                },
                child: const Text("Google Login"),
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildThirdPartyLogin(),
          ],
        ),
      )
    );
  }
}
