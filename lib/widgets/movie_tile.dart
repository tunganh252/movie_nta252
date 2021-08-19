import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_nta252/models/movie.dart';

class MovieTile extends StatelessWidget {
  final GetIt getIt = GetIt.instance;
  final double height;
  final double width;
  final Movie movie;

  MovieTile(
      {Key? key,
      required this.height,
      required this.width,
      required this.movie})
      : super(key: key);

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
        // height: height,
        // width: width * 0.66,
        // child: Column(
        //   mainAxisSize: MainAxisSize.max,
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Row(
        //       mainAxisSize: MainAxisSize.max,
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         Container(
        //             width: width * 0.56,
        //             child: Text(
        //               movie.name,
        //               overflow: TextOverflow.ellipsis,
        //               style: TextStyle(
        //                   fontSize: 22,
        //                   color: Colors.white,
        //                   fontWeight: FontWeight.w400),
        //             )),
        //         Text(
        //           movie.rating.toString(),
        //           style: TextStyle(fontSize: 22, color: Colors.white),
        //         )
        //       ],
        //     )
        //   ],
        // ),
        );
  }

  Widget _moviePosterWidget(String _imageUrl) {
    return Container(
      height: height,
      width: width,
      decoration:
          BoxDecoration(image: DecorationImage(image: NetworkImage(_imageUrl))),
    );
  }
}
