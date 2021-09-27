import 'package:barbershop/controller/home_controller.dart';
import 'package:barbershop/controller/movieListController.dart';
import 'package:barbershop/controller/search_controller.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var textController = MaskedTextController(mask: '000 000 0000');

  @override
  Widget build(BuildContext context) {
    MovieListController controller = Get.put(MovieListController());
    SearchController searchController = Get.put(SearchController());

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Color primaryColor = Theme.of(context).primaryColor;
    Color primaryColorDark = Theme.of(context).primaryColorDark;
    Color primaryColorLight = Theme.of(context).primaryColorLight;
    Color cardColor = Theme.of(context).cardColor;
    return Scaffold(
        backgroundColor: cardColor,
        body: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + height * 0.01),
          child: Center(
            child: Container(
              height: height,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.9,
                    height: height * 0.06,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: TextField(
                        // controller: textController,
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(RegExp("[0-9],[a-]")),
                        //   LengthLimitingTextInputFormatter(10),
                        // ],
                        textInputAction: TextInputAction.search,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: primaryColorLight,
                          fontSize: 15,
                          fontFamily: 'sans_fa',
                        ),
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                            hintText: 'برای جستجو کلیک کنید',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: InputBorder.none),
                        onChanged: (value) {
                          // controller.phoneNumber.value = value;
                          // print('${value.toString().replaceAll(RegExp(' '), '')}');
                          searchController.fetchBarberSearchList(value);
                        },
                        onSubmitted: (value) {
                          // GetStorage().write('code', value);
                          // verificationController.getAccess();
                          searchController.fetchBarberSearchList(value);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Expanded(
                      child: Obx(
                    () => StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount:
                            searchController.searchBarber.value.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.03,
                                vertical: height * 0.012),
                            child: Container(
                              width: width * 0.44,
                              height: height * 0.35,
                              decoration: BoxDecoration(
                                  // border: Border.all(
                                  //     color: primaryColor, width: 1.8),
                                  color: primaryColorDark,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(width * 0.04),
                                    child: Container(
                                      height: width * 0.36,
                                      width: width * 0.36,
                                      child: Center(
                                        child: Obx(
                                          () => Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    'https://image.tmdb.org/t/p/w500/${controller.nowPlayingMovie.value.results[index].posterPath}'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.04,
                                        vertical: height * 0.01),
                                    child: Obx(
                                      () => Text(
                                        '${searchController.searchBarber.value.data[index].nameShop}',
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: 'titr',
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.04,
                                        vertical: height * 0.01),
                                    child: Obx(
                                      () => Text(
                                        '${searchController.searchBarber.value.data[index].phone}',
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                          );
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1)),
                  ))
                ],
              ),
            ),
          ),
        ));
  }
}
