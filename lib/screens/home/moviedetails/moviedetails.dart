import 'package:firstproject/screens/home/moviedetails/moviedescription.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          children: [
            movieImage(screenSize),
            Positioned(
              top: 25,
              child: BackButton(),
            ),
            Positioned(
              top: screenSize.height * 0.36,
              right: 20,
              child: downloadButton(),
            ),
            Positioned(
              top: screenSize.height * .45,
              child: MovieDescription(),
            )
          ],
        ),
      ),
    );
  }

  Widget downloadButton() {
    return MaterialButton(
      shape: StadiumBorder(),
      onPressed: () {},
      color: Colors.green,
      child: Row(
        
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(

            Icons.file_download,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text("Download", style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }

  Widget movieImage(Size size) {
    return Image.asset(
      "assets/slider2.jpg",
      height: size.height * .6,
      fit: BoxFit.fitHeight,
    );
  }
}
