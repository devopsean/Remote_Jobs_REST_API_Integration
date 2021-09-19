//Packages
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

//Models
import '../models/movie.dart';

class MovieTile extends StatelessWidget {
  final GetIt _getIt = GetIt.instance;

  final double height;
  final double width;
  final Movie movie;

  MovieTile({this.movie, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_moviePosterWidget(movie.posterURL()), _movieInfoWidget()],
      ),
    );
  }

  Widget _movieInfoWidget() {
    return Container(
      height: height,
      width: width * 0.66,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // color: Colors.red,
                //width: width * 0.56,
                width: width * 0.5,
                child: Text(
                  movie.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                movie.rating.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, height * .02, 0, 0),
            child: Text(
              '${movie.language.toUpperCase()} | R: ${movie.isAdult} ${movie.releaseDate}',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, height * .07, 0, 0),
            //height added by yours truly
            height: height * .7,
            child: Text(
              movie.description,
              maxLines: 9,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _moviePosterWidget(String _imageUrl) {
    return Container(
      height: height,
      width: width * .35,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_imageUrl),
        ),
      ),
    );
  }
}
