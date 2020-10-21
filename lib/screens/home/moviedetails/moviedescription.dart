import 'package:firstproject/api/apis.dart';
import 'package:firstproject/models/castmodel.dart';
import 'package:firstproject/models/moviemodel.dart';
import 'package:firstproject/screens/home/moviedetails/moviedescriptioncontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/state_manager.dart';

class MovieDescription extends StatelessWidget {
  final MovieDescriptionController _controller = MovieDescriptionController();
  final MovieModel movie;
  MovieDescription(this.movie);

  _refresh(Size size) async {
    Map<String, dynamic> response = await MovieAPI.movieDetail(movie.id);
    if (response['statusCode'] == 200) {
      List castingList = response['response']['data']['movie']['cast'];
      List<Widget> personnelList = List();
      for (Map<String, dynamic> each in castingList) {
        try {
          CastModel castModel = CastModel(
              actorName: each['name'],
              characterName: each['character_name'],
              imageUrl: each['url_small_image']);
          personnelList.add(personnelItem(size, castModel));
        } catch (e) {
          print(e);
          continue;
        }
      }
      _controller.setCastList = personnelList;
    } else {
      _controller.setCastList = [
        Center(child: Text("Error getting casting details"))
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    _refresh(screenSize);
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
            height: size.height * .25,
            child: Obx(
              () => ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: _controller.castList,
              ),
            ))
      ],
    );
  }

  Widget personnelItem(Size size, CastModel cast) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: size.height * 0.025, bottom: size.height * 0.025, right: 20),
          height: size.height * .13,
          width: size.height * .13,
          decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          child: ClipRRect(
            child: Image.network(
              cast.imageUrl == null
                  ? "https://www.nicepng.com/png/detail/138-1388174_login-account-icon.png"
                  : cast.imageUrl,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(size.width),
          ),
        ),
        Text(cast.actorName,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        Text(
          "(${cast.characterName})",
          style: TextStyle(color: Colors.grey.shade700),
        )
      ],
    );
  }

  Widget description() {
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
          movie.getDescription,
          style: TextStyle(color: Colors.grey.shade700),
        )
      ],
    );
  }

  Widget genreList(Size size) {
    List _temp = List();
    _temp.add(movie.getRuntime.toString() + " Minutes");
    _temp.addAll(movie.getGenres);
    return Container(
      height: size.height * 0.05,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [for (var each in _temp) eachGenre(each)],
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
          ignoreGestures: true,
          initialRating: double.parse(movie.getRating.toString()) / 2,
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
          movie.getRating.toString(),
          style: TextStyle(
              color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Text title() {
    return Text(
      movie.getTitle,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
