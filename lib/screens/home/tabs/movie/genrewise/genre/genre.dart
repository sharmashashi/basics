import 'package:firstproject/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Genre extends StatelessWidget {
  final double height;
  final String genre;
  Genre({@required this.genre, @required this.height});
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: height,
      width: screenSize.width,
      child: ListView(
        children: [
          eachMovie(screenSize),
          eachMovie(screenSize),
          eachMovie(screenSize),
          eachMovie(screenSize),
          eachMovie(screenSize),
          eachMovie(screenSize),
          eachMovie(screenSize),
          eachMovie(screenSize),
          eachMovie(screenSize)
        ],
      ),
    );
  }

  Widget eachMovie(Size screenSize) {
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
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 10),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("United State/3D"),
                        Text("Director: First Last")
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
              child: Image.asset(
                "assets/slider1.jpg",
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
