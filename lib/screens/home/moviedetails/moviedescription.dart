import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.55,
      width: screenSize.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            title(),
            SizedBox(
              height: 10,
            ),
            rating(),
            SizedBox(
              height: 10,
            ),
            genreList(screenSize),
            SizedBox(height: 30),
            description(),
            SizedBox(
              height: 30,
            ),
            personnel(screenSize)
          ],
        ),
      ),
    );
  }

  Widget personnel(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Personnel",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Row(
              children: [
                Text("More", style: TextStyle(color: Colors.blue)),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                  size: 20,
                )
              ],
            )
          ],
        ),
        Container(
          alignment: Alignment.center,
          height: size.height * .18,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              personnelItem(size),
              personnelItem(size),
              personnelItem(size),
              personnelItem(size),
              personnelItem(size),
              personnelItem(size),
              personnelItem(size),
            ],
          ),
        )
      ],
    );
  }

  Widget personnelItem(Size size) {
    return Container(
      margin: EdgeInsets.only(
          top: size.height * 0.025, bottom: size.height * 0.025, right: 20),
      height: size.height * .13,
      width: size.height * .13,
      decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
      child: ClipRRect(
        child: Image.asset(
          "assets/slider1.jpg",
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(size.width),
      ),
    );
  }

  Widget description() {
    String des =
        "This is a lightweight web service, (REST interface), which provides an easy way to access the YTS website.An API (Application programming interface) is a protocol intended to be used as an interface by software components to communicate with each other.Our API supports many methods, so there should not be a problem coding some nice applications.If you find any bug, or have any questions, or any suggestions please get in touch with us";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Movie Plot",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          des,
          style: TextStyle(color: Colors.grey.shade700),
        )
      ],
    );
  }

  Widget genreList(Size size) {
    return Container(
      height: size.height * 0.05,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          eachGenre("122 min"),
          eachGenre("content"),
          eachGenre("content"),
          eachGenre("content"),
          eachGenre("content"),
        ],
      ),
    );
  }

  Widget eachGenre(String content) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5, right: 10),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(5)),
      child: Text(
        content,
        style: TextStyle(color: Colors.blue),
      ),
    );
  }

  Row rating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
          itemSize: 18,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          "3.5",
          style: TextStyle(
              color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Text title() {
    return Text(
      "Alita: Battle Angel",
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
