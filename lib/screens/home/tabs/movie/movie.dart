import 'package:firstproject/screens/home/tabs/movie/genrewise/genre/genre.dart';
import 'package:firstproject/screens/home/tabs/movie/genrewise/recommended_movies/recommended.dart';
import 'package:firstproject/screens/home/tabs/movie/moviecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Movie extends StatelessWidget {
  final MovieController _movieController = MovieController();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    _movieController.setSelectedGenre = Recommended(screenSize.height - 130);
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      child: Stack(
        children: [
          Positioned(
              top: 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: topBarBuilder(screenSize),
              )),
          Positioned(
            top: 80,
            child: genres(screenSize),
          ),
          Positioned(
              top: 130,
              child: Obx(
                () => _movieController.selectedGenre,
              ))
        ],
      ),
    );
  }

  Widget genres(Size screenSize) {
    return Container(
      height: 50,
      width: screenSize.width,
      child: Obx(
        () => ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (int i = 0; i < _movieController.movieGenres.length; i++)
              eachTabBuilder(screenSize,
                  genre: _movieController.movieGenres[i],
                  index: i,
                  color: i == _movieController.currentIndex
                      ? _movieController.enableColor
                      : _movieController.disableColor)
          ],
        ),
      ),
    );
  }

  Widget eachTabBuilder(Size screenSize,
      {@required int index, @required String genre, @required Color color}) {
    return GestureDetector(
      onTap: () {
        _movieController.updateCurrentIndex(index);
        if (index == 0) {
          _movieController.setSelectedGenre =
              Recommended(screenSize.height - 130);
        } else {
          _movieController.setSelectedGenre =
              Genre(_movieController.movieGenres[index]);
        }
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: color),
          height: 30,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          alignment: Alignment.center,
          child: Text(
            genre,
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Widget topBarBuilder(Size screenSize) {
    return SizedBox(
      width: screenSize.width - 40,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Movie",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26)),
          searchButton(),
        ],
      ),
    );
  }

  Widget searchButton() {
    return FlatButton(
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 15,
      ),
      color: Colors.teal.shade900,
      onPressed: () {},
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey.shade300,
            size: 18,
          ),
          Text(
            "Search",
            style: TextStyle(color: Colors.grey.shade300),
          )
        ],
      ),
    );
  }
}
