import 'package:barbershop/controller/movieListController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    MovieListController controller = Get.put(MovieListController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Color primaryColor = Theme.of(context).primaryColor;
    Color primaryColorDark = Theme.of(context).primaryColorDark;
    Color primaryColorLight = Theme.of(context).primaryColorLight;
    Color cardColor = Theme.of(context).cardColor;

    return Scaffold(
        backgroundColor: cardColor,
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.01),
                height: height * 0.18,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: EdgeInsets.only(right: width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.01),
                            child: Obx(
                              () => Text(
                                '${controller.nowPlayingMovie.value.results[1].originalTitle}',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'titr',
                                  fontWeight: FontWeight.bold,
                                  color: primaryColorDark,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.01),
                            child: Text(
                              '${controller.nowPlayingMovie.value.results[1].releaseDate}',
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: primaryColorDark,
                                fontFamily: 'titr',
                              ),
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: width * 0.13,
                        backgroundImage: NetworkImage(
                            'https://image.tmdb.org/t/p/w500/${controller.nowPlayingMovie.value.results[0].posterPath}'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
