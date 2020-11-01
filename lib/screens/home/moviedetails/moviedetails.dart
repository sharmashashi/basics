import 'dart:io';

import 'package:firstproject/models/moviemodel.dart';
import 'package:firstproject/screens/home/moviedetails/moviedescription.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MovieDetails extends StatelessWidget {
  final MovieModel movie;
  MovieDetails(this.movie);
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
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: BackButton(),
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              ),
            ),
            Positioned(
              top: screenSize.height * 0.36,
              left: 20,
              right: 20,
              child: SizedBox(
                height: 50,
                width: Get.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var each in movie.getTorrents)
                      downloadButton(
                          quality: each['quality'], downloadUrl: each['url'])
                  ],
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * .45,
              child: MovieDescription(movie),
            )
          ],
        ),
      ),
    );
  }

  Widget downloadButton(
      {@required String quality, @required String downloadUrl}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        shape: StadiumBorder(),
        onPressed: () async {
          _download();
        },
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
            Text(quality, style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }

  _download() async {
    //give storage permission from permission_handler
    PermissionStatus status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      print("granted");
    } else if (status == PermissionStatus.denied) {
      print("denied");
    } else {
      print(status);
    }
    //
    Directory dir = await getExternalStorageDirectory();
    String path = dir.parent.parent.parent.parent.path;
    Directory downloadDir = await Directory(path + "/YtsMovies").create();
    String downloadPath = downloadDir.path;
    print(downloadPath);
  }

  Widget movieImage(Size size) {
    return Image.network(
      movie.getImageUrl,
      height: size.height * .6,
      width: size.width,
      fit: BoxFit.fitWidth,
    );
  }
}
