import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:barbershop/model/movieList.dart';
import 'package:barbershop/service/check_connectivity.dart';
import 'package:barbershop/view/homePage.dart';

class MovieListController extends GetxController {
  var upcomingMovie = MovieList().obs;
  var nowPlayingMovie = MovieList().obs;
  var popularMovie = MovieList().obs;
  var topRatedMovie = MovieList().obs;
  var imgUrl = [].obs;
  var code = 0.obs;

  List<String> urls = [
    'https://api.themoviedb.org/3/movie/upcoming?api_key=2f5bd23a1edaf4f2792074ae04fed337&language=en-US',
    'https://api.themoviedb.org/3/movie/now_playing?api_key=2f5bd23a1edaf4f2792074ae04fed337&language=en-US',
    'https://api.themoviedb.org/3/movie/popular?api_key=2f5bd23a1edaf4f2792074ae04fed337&language=en-US',
    'https://api.themoviedb.org/3/movie/top_rated?api_key=2f5bd23a1edaf4f2792074ae04fed337&language=en-US'
  ];

  @override
  void onInit() {
    fetchMovieList();
    super.onInit();
  }

  void fetchMovieList() async {
    try {
      var movieData = await CheckConnectivity.fetchListData(urls[0]);
      var movieData2 = await CheckConnectivity.fetchListData(urls[1]);
      // var movieData3 = await RemoteService.fetchListData(urls[2]);
      // var movieData4 = await RemoteService.fetchListData(urls[3]);
      if (movieData != null) {
        upcomingMovie.value = movieData;
        print(upcomingMovie);
        print(upcomingMovie.value.results.length);
        for (int i = 0; i < 5; i++)
          imgUrl.add(
              'https://image.tmdb.org/t/p/w500/${upcomingMovie.value.results[i].backdropPath}');
        for (int i = 0; i < 5; i++) print(imgUrl[i]);
        if (movieData2 != null) nowPlayingMovie.value = movieData2;
        print(nowPlayingMovie.value.results.length);
        // if (movieData3 != null) popularMovie.value = movieData3;
        // if (movieData4 != null) topRatedMovie.value = movieData4;
        Timer(Duration(milliseconds: 2000), () => Get.to(() => HomePage()));
      }
    } finally {}
  }
}
