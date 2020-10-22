import 'package:connectivity/connectivity.dart';
import 'package:firstproject/api/apis.dart';
import 'package:firstproject/models/moviemodel.dart';
import 'package:firstproject/screens/home/moviedetails/moviedetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [Container()];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "This is search result");
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      initialData: [],
      future: _suggestions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LinearProgressIndicator();
        } else if (snapshot.hasData == false) {
          return Center(child: Text("No result found"));
        } else {
          return ListView(
            children: snapshot.data,
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      initialData: [],
      future: _suggestions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LinearProgressIndicator();
        } else if (snapshot.hasData == false) {
          return Center(child: Text("No result found"));
        } else {
          return ListView(
            children: snapshot.data,
          );
        }
      },
    );
  }

  Future<List<Widget>> _suggestions() async {
    List<Widget> list = List();

    ConnectivityResult connectionResult =
        await Connectivity().checkConnectivity();

    if (connectionResult == ConnectivityResult.mobile ||
        connectionResult == ConnectivityResult.wifi) {
      print("connecaton exists");
      Map<String, dynamic> result = await MovieAPI.movieSerch(query);
      if (result['statusCode'] == 200) {
        List searchResponseList = result['response']['data']['movies'];
        for (Map<String, dynamic> each in searchResponseList) {
          MovieModel movie = MovieModel(
              coverImageUrl: each['medium_cover_image'],
              title: each['title_english'],
              description: each['description_full'],
              genres: each['genres'],
              id: each['id'],
              rating: each['rating'],
              runtime: each['runtime'],
              torrents: each['torrents']);
          list.add(_suggestionCard(movie));
        }
        if (list.length == 0) {
          list = [Text("No result found")];
        }
      } else {
        list = [Text("Something went wrong!!!")];
      }
    } else {
      print("no connection");
      list = [Text("No Internet connection")];
    }

    return list;
  }

  Widget _suggestionCard(MovieModel movie) {
    return GestureDetector(
      onTap: () {
        Get.to(MovieDetails(movie));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: Get.width,
        height: Get.height * 0.15,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0.5, .5),
                  color: Colors.grey.shade300,
                  blurRadius: 1,
                  spreadRadius: 0.5)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                movie.getImageUrl,
                height: Get.height * 0.12,
                width: Get.width * 0.20,
                fit: BoxFit.fill,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width * 0.5,
                    height: 40,
                    child: Text(movie.getTitle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar(
                        initialRating:
                            double.parse(movie.getRating.toString()) / 2,
                        allowHalfRating: true,
                        onRatingUpdate: (val) {},
                        itemBuilder: (ctx, index) {
                          return Icon(
                            Icons.star,
                            color: Colors.amber.shade400,
                          );
                        },
                        itemSize: 14,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        movie.getRating.toString(),
                        style: TextStyle(color: Colors.amber, fontSize: 14),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    movie.runtime.toString() + " Min",
                    style: TextStyle(color: Colors.black),
                  ),
                  // Text(movie.)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
