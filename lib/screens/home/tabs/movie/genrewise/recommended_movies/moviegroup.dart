import 'package:firstproject/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieGroup extends StatelessWidget {
  final String movieGroup;
  MovieGroup(this.movieGroup);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
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
              children: [
                eachMovie(screenSize),
                eachMovie(screenSize),
                eachMovie(screenSize),
                eachMovie(screenSize),
                eachMovie(screenSize),
                eachMovie(screenSize),
                eachMovie(screenSize),
                eachMovie(screenSize),
                eachMovie(screenSize),
                eachMovie(screenSize),
                eachMovie(screenSize),
                eachMovie(screenSize),
                eachMovie(screenSize),
                eachMovie(screenSize),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget eachMovie(Size screenSize) {
    return Padding(
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
