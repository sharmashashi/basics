import 'dart:math';

import 'package:firstproject/api/apis.dart';
import 'package:firstproject/models/moviemodel.dart';
import 'package:firstproject/screens/home/moviedetails/moviedetails.dart';
import 'package:firstproject/screens/home/tabs/movie/genrewise/recommended_movies/moviegroupcontroller.dart';
import 'package:firstproject/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class MovieGroup extends StatelessWidget {
  final String movieGroup, sortBy;
  final MovieGroupController _movieGroupController = MovieGroupController();
  MovieGroup(this.movieGroup, {@required this.sortBy});

  _refresh(Size screenSize) async {
    Map<String, dynamic> response =
        await MovieAPI.movieBySort(page: Random().nextInt(500), sortBy: sortBy);
    if (response['statusCode'] == 200) {
      List movieList = response['response']['data']['movies'];
      List<Widget> popularMovies = List();
      for (Map<String, dynamic> each in movieList) {
        MovieModel movie = MovieModel(
            title: each['title_english'],
            rating: each['rating'],
            genres: each['genres'],
            description: each['description_full'],
            coverImageUrl: each['medium_cover_image'],
            runtime: each['runtime'],
            torrents: each['torrents']);
        popularMovies.add(GestureDetector(
          onTap: () {
            Get.to(MovieDetails(movie));
          },
          child: eachMovie(screenSize),
        ));
      }
      _movieGroupController.setPopularMovies = popularMovies;
    } else {
      _movieGroupController.setPopularMovies = [
        Center(child: Text("Error getting movies"))
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    _refresh(screenSize);
    return  Container(
          margin: EdgeInsets.only(top: 10, left: 20),
          height: screenSize.height * 0.3,
          width: screenSize.width,
          child: Column(
            children: [
              topRow(),
              SizedBox(
                height: screenSize.height * 0.22,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: _movieGroupController.popularMovies),
              )
            ],
          ),
        );
  }

  Widget eachMovie(Size screenSize) {
    return GestureDetector(
      onTap: () {
        // Get.to(MovieDetails());
      },
      child: Padding(
        padding: EdgeInsets.only(right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                "assets/slider1.jpg",
                height: screenSize.height * 0.15,
                width: screenSize.height * 0.1,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Title",
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingBar(
                  initialRating: 3.5,
                  allowHalfRating: true,
                  onRatingUpdate: (val) {},
                  itemBuilder: (ctx, index) {
                    return Icon(
                      Icons.star,
                      color: Colors.amber.shade400,
                    );
                  },
                  itemSize: 10,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "3.5",
                  style: TextStyle(color: Colors.amber, fontSize: 10),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget topRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(movieGroup,
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        FlatButton(
          child: Text(
            "More",
            style: TextStyle(color: grey),
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
