import 'package:flutter/material.dart';

class Genre extends StatelessWidget {
  final String genre;
  Genre(this.genre);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(genre),
      ),
    );
  }
}
