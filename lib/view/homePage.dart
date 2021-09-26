import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:barbershop/components/carouselImageComponent.dart';
import 'package:barbershop/controller/movieListController.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final MovieListController movieListController =
        Get.put(MovieListController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Color primaryColor = Theme.of(context).primaryColor;
    Color primaryColorDark = Theme.of(context).primaryColorDark;
    Color primaryColorLight = Theme.of(context).primaryColorLight;
    return Scaffold(
      backgroundColor: Color(0xff0f1f38),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
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
              height: MediaQuery.of(context).size.height * 0.001,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Text(
                  'Now Playing',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (context, position) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.02),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: height * 0.235,
                              width: height * 0.12,
                              margin: EdgeInsets.symmetric(
                                  horizontal: width * 0.02,
                                  vertical: height * 0.04),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: height * 0.12,
                                    width: height * 0.12,
                                    child: new Stack(
                                      children: [
                                        Center(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            height: height * 0.12,
                                            width: height * 0.12,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xFFE4E4E4),
                                                  width: 1.5),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30),
                                                topRight: Radius.circular(30),
                                                bottomLeft: Radius.circular(50),
                                                bottomRight:
                                                    Radius.circular(50),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(
                                            child: Obx(
                                          () => Container(
                                            padding: EdgeInsets.all(10),
                                            height: height * 0.105,
                                            width: height * 0.105,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30),
                                                topRight: Radius.circular(30),
                                                bottomLeft: Radius.circular(50),
                                                bottomRight:
                                                    Radius.circular(50),
                                              ),
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    'https://image.tmdb.org/t/p/w500/${movieListController.nowPlayingMovie.value.results[position].posterPath}'),
                                              ),
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: height * 0.092,
                                    width: height * 0.12,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: Obx(
                                          () => Text(
                                            '${movieListController.nowPlayingMovie.value.results[position].originalTitle}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: 'sans',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        )),
                                        Center(
                                          child: Text(
                                            '${movieListController.nowPlayingMovie.value.results[position].originalTitle}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: 'sansThin',
                                                fontSize: 13),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
