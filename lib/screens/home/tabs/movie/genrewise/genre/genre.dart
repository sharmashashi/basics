import 'package:firstproject/api/apis.dart';
import 'package:firstproject/models/moviemodel.dart';
import 'package:firstproject/screens/home/moviedetails/moviedetails.dart';
import 'package:firstproject/screens/home/tabs/movie/genrewise/genre/genrecontroller.dart';
import 'package:firstproject/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class Genre extends StatelessWidget {
  final double height;
  final String genre;
  Genre({@required this.genre, @required this.height});

  final GenreController _genreController = GenreController();

  _refresh(Size screenSize) async {
    Map<String, dynamic> response =
        await MovieAPI.movieByGenre(genre.toLowerCase());

    if (response['statusCode'] == 200) {
      List movieList = response['response']['data']['movies'];
      List<Widget> movies = List();

      for (Map<String, dynamic> each in movieList) {
        MovieModel movie = MovieModel(
          id: each['id'],
            title: each['title_english'],
            rating: each['rating'],
            genres: each['genres'],
            description: each['description_full'],
            coverImageUrl: each['medium_cover_image'],
            runtime: each['runtime'],
            torrents: each['torrents']);
        movies.add(GestureDetector(
          onTap: () {
            Get.to(MovieDetails(movie));
          },
          child: eachMovie(screenSize, movie),
        ));
      }
      _genreController.setMovieList = movies;
    } else {
      _genreController.setMovieList = [
        Center(child: Text("Error getting movies"))
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    _refresh(screenSize);
    return SizedBox(
        height: height,
        width: screenSize.width,
        child: Obx(
          () => ListView(
            children: _genreController.movieList,
          ),
        ));
  }

  Widget eachMovie(Size screenSize, MovieModel movie) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: screenSize.height * 0.25,
      width: screenSize.width,
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: screenSize.width * 0.05,
            child: Container(
              decoration: BoxDecoration(
                  color: primarylight, borderRadius: BorderRadius.circular(10)),
              width: screenSize.width * 0.9,
              height: screenSize.height * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar(
                              initialRating:
                                  double.parse(movie.rating.toString()) / 2,
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
                              movie.rating.toString(),
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 10),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          movie.runtime.toString() + " Min",
                          style: TextStyle(color: Colors.white),
                        ),
                        // Text(movie.)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: screenSize.width * 0.12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                movie.coverImageUrl,
                height: screenSize.height * 0.20,
                width: screenSize.height * 0.15,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
