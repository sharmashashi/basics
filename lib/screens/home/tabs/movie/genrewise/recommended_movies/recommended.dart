import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firstproject/api/apis.dart';
import 'package:firstproject/models/moviemodel.dart';
import 'package:firstproject/screens/home/tabs/movie/genrewise/recommended_movies/moviegroup.dart';
import 'package:firstproject/screens/home/tabs/movie/genrewise/recommended_movies/recommendedcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Recommended extends StatelessWidget {
  RecommendedController _recommendedController = RecommendedController();
  final double height;
  Recommended(this.height);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
        height: height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            _slider(screenSize),
            MovieGroup("Popular"),
            MovieGroup("Coming Soon"),
            SizedBox(
              height: 50,
            )
          ],
        ));
  }

  Widget _slider(Size screenSize) {
    Random rand = Random();
    int page = rand.nextInt(100);
    MovieAPI.listMovies(limit: 5, page: page).then((response) {
      if (response['statusCode'] == 200) {
        List movieList = response['response']['data']['movies'];
        List<Widget> movieImages = List();
        for (Map<String, dynamic> each in movieList) {
          MovieModel movie = MovieModel(
              title: each['title_english'],
              rating: each['rating'],
              genres: each['genres'],
              description: each['description_full'],
              coverImageUrl: each['small_cover_image'],
              runtime: each['runtime'],
              torrents: each['torrents']);

          movieImages.add(Image.network(movie.coverImageUrl));
        }

        _recommendedController.setSliderItems = movieImages;
      } else {
        _recommendedController.setSliderItems = [
          Center(child: Text("Error getting movies"))
        ];
      }
    });
    return Obx(() => Container(
          height: height * 0.35,
          width: screenSize.width,
          color: Colors.white,
          child: CarouselSlider(
            items: _recommendedController.sliderItems,
            options: CarouselOptions(
                aspectRatio: 4 / 3,
                onPageChanged: (index, reason) {},
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 1)),
          ),
        ));
  }
}
