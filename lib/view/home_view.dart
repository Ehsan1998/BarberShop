import 'package:barbershop/controller/home_tab_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:barbershop/components/carouselImageComponent.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeTabController homeTabController = Get.put(HomeTabController());

  @override
  void dispose() {
    homeTabController.visible.value = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Color primaryColor = Theme.of(context).primaryColor;
    Color primaryColorDark = Theme.of(context).primaryColorDark;
    Color primaryColorLight = Theme.of(context).primaryColorLight;
    Color cardColor = Theme.of(context).cardColor;
    return Scaffold(
        backgroundColor: primaryColorDark,
        body: new Stack(
          children: [
            Visibility(
              child: Container(
                color: primaryColorDark,
                width: width,
                height: height,
                child: Center(
                  child: SpinKitDoubleBounce(
                    size: height * 0.1,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            Visibility(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: width,
                      height: height * 0.4,
                      child: CarouselSlider(
                        items: NewComponent().imageItem(),
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 8,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.001,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(height * 0.04),
                              topRight: Radius.circular(height * 0.04))),
                      child: Padding(
                        padding: EdgeInsets.only(top: height * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: width * 0.05),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: height * 0.006,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: primaryColor,
                                              width: width * 0.002),
                                          borderRadius: BorderRadius.only(
                                            topRight:
                                                Radius.circular(height * 0.005),
                                            bottomRight:
                                                Radius.circular(height * 0.005),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    Text(
                                      'پیشنهاد ویژه',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'sans',
                                        fontSize: height * 0.022,
                                        color: primaryColorLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: ListView.builder(
                                  reverse: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 15,
                                  itemBuilder: (context, position) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.027),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          // height: height * 0.235,
                                          width: height * 0.14,
                                          margin: EdgeInsets.symmetric(
                                              vertical: height * 0.04),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: height * 0.13,
                                                width: height * 0.13,
                                                child: new Stack(
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        height: height * 0.13,
                                                        width: height * 0.13,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  primaryColor,
                                                              width: 1.5),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    30),
                                                            topRight:
                                                                Radius.circular(
                                                                    30),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    50),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    50),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                        child: Obx(
                                                      () => Container(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        height: height * 0.12,
                                                        width: height * 0.12,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    30),
                                                            topRight:
                                                                Radius.circular(
                                                                    30),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    50),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    50),
                                                          ),
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(
                                                                'https://www.ehsankatebi.ir${homeTabController.barbersSuggest.value.data[position].imageHairdressingDegree}'),
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Center(
                                                    child: Obx(
                                                  () => Text(
                                                    '${homeTabController.barbersSuggest.value.data[position].nameShop}',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      fontFamily: 'titr',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                )),
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    '${homeTabController.barbersSuggest.value.data[position].phone}',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      color: primaryColorLight,
                                                      fontFamily: 'titr',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: width * 0.05),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: height * 0.006,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: primaryColor,
                                              width: width * 0.002),
                                          borderRadius: BorderRadius.only(
                                            topRight:
                                                Radius.circular(height * 0.005),
                                            bottomRight:
                                                Radius.circular(height * 0.005),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    Text(
                                      'پر تخفیف ها',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'sans',
                                        fontSize: height * 0.022,
                                        color: primaryColorLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Container(
                              height: height * 0.3,
                              child: ListView.builder(
                                  reverse: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 15,
                                  itemBuilder: (context, position) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.027),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          // height: height * 0.235,
                                          width: height * 0.14,
                                          margin: EdgeInsets.symmetric(
                                              vertical: height * 0.04),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: height * 0.13,
                                                width: height * 0.13,
                                                child: new Stack(
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        height: height * 0.13,
                                                        width: height * 0.13,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  primaryColor,
                                                              width: 1.5),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    30),
                                                            topRight:
                                                                Radius.circular(
                                                                    30),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    50),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    50),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                        child: Obx(
                                                      () => Container(
                                                        height: height * 0.12,
                                                        width: height * 0.12,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    30),
                                                            topRight:
                                                                Radius.circular(
                                                                    30),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    50),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    50),
                                                          ),
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(
                                                                'https://www.ehsankatebi.ir${homeTabController.barbersOffer.value.data[position].imageHairdressingDegree}'),
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Center(
                                                    child: Obx(
                                                  () => Text(
                                                    '${homeTabController.barbersOffer.value.data[position].nameShop}',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      fontFamily: 'titr',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                )),
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Obx(
                                                    () => Text(
                                                      '${homeTabController.barbersOffer.value.data[position].phone}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        color:
                                                            primaryColorLight,
                                                        fontFamily: 'titr',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
