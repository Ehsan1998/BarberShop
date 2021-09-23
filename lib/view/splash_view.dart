import 'dart:async';
import 'package:barbershop/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  SplashController controller = Get.put(SplashController());

  AnimationController _animationController;

  @override
  void initState() {
    Timer(Duration(milliseconds: 4000), () => code());

    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    Timer(Duration(milliseconds: 500), () => _animationController.forward());

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    controller.loading.value = true;
    controller.tryAgain.value = false;
    controller.code.value = 0;
    super.dispose();
  }

  void code() {}

  @override
  Widget build(BuildContext context) {

Color primaryColor = Theme.of(context).primaryColor;
Color primaryColorDark = Theme.of(context).primaryColorDark;
Color primaryColorLight = Theme.of(context).primaryColorLight;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: primaryColorDark,
        body: new Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeTransition(
                    child: Container(
                      child: SvgPicture.asset('image/logo.svg'),
                      height: 0.18 * height,
                    ),
                    opacity: _animationController,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.07),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(0, 0.8),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: Text(
                          'با تایمینو\nزمانتو سیو کن',
                          style: TextStyle(
                            fontFamily: 'titr',
                            fontSize: height * 0.05,
                            color:primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: height * 0.08, top: height * 0.86),
                child: Obx(
                  () => Visibility(
                    visible: controller.loading.value,
                    child: SpinKitDoubleBounce(
                      size: height * 0.06,
                      color: primaryColorLight,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(bottom: height * 0.08),
                child: Obx(
                  () => Visibility(
                    visible: controller.tryAgain.value,
                    child: GestureDetector(
                      onTap: () {
                        controller.getStatusCode();
                        controller.tryAgain.value = false;
                        controller.loading.value = true;
                      },
                      child: Text(
                        'خطا در برقراری ارتباط\n\nتلاش مجدد',
                        style: TextStyle(
                          fontFamily: 'sans_bold',
                          fontSize: height * 0.015,
                          color: primaryColorLight,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
