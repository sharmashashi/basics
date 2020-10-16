import 'package:carousel_slider/carousel_slider.dart';
import 'package:firstproject/screens/home/tabs/movie/genrewise/recommended_movies/moviegroup.dart';
import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  final double height;
  Recommended(this.height);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
        height: height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [_slider(screenSize),
          MovieGroup("Popular"),
          MovieGroup("Coming Soon"),


SizedBox(height: 50,)
          ],
        ));
  }

  Widget _slider(Size screenSize) {
    return Container(
      height: height * 0.35,
      width: screenSize.width,
      color: Colors.white,
      child: CarouselSlider(
        items: [
          Image.asset("assets/slider1.jpg"),
          Image.asset("assets/slider2.jpg")
        ],
        options: CarouselOptions(
            aspectRatio: 4 / 3,
            onPageChanged: (index, reason) {},
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 1)),
      ),
    );
  }
}
