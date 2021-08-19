import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_nta252/models/movie.dart';
import 'package:movie_nta252/models/search_category.dart';
import 'package:movie_nta252/widgets/movie_tile.dart';

class MainPage extends ConsumerWidget {
  double? deviceHeight;
  double? deviceWidth;
  TextEditingController? searchTextFieldController;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    searchTextFieldController = TextEditingController();
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [_backgroundWidget(), _foregroundWidgets()],
        ),
      ),
    );
  }

  Widget _backgroundWidget() {
    return Container(
      height: deviceHeight,
      width: deviceWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
              image: NetworkImage(
                  'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/ogntmK9hwBomhajqYrHXUAaqkd7.jpg'),
              fit: BoxFit.cover)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
      ),
    );
  }

  Widget _foregroundWidgets() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, deviceHeight! * 0.02, 0, 0),
      width: deviceWidth! * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topBarWidget(),
          Container(
            height: deviceHeight! * 0.83,
            padding: EdgeInsets.symmetric(vertical: deviceHeight! * 0.01),
            child: _moviesListViewWidget(),
          )
        ],
      ),
    );
  }

  Widget _topBarWidget() {
    return Container(
      height: deviceHeight! * 0.08,
      decoration: BoxDecoration(
          color: Colors.black54, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_searchFieldWidget(), _categorySelectionWidget()],
      ),
    );
  }

  Widget _searchFieldWidget() {
    final _border = InputBorder.none;
    return Container(
      width: deviceWidth! * 0.50,
      height: deviceHeight! * 0.05,
      child: TextField(
        controller: searchTextFieldController,
        onSubmitted: (_input) {},
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            focusedBorder: _border,
            border: _border,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white24,
            ),
            hintStyle: TextStyle(color: Colors.white54),
            filled: false,
            fillColor: Colors.white24,
            hintText: "Search..."),
      ),
    );
  }

  Widget _categorySelectionWidget() {
    return DropdownButton(
      dropdownColor: Colors.black38,
      value: SearchCategory.popular,
      icon: Icon(
        Icons.menu,
        color: Colors.white24,
      ),
      underline: Container(height: 1, color: Colors.white24),
      onChanged: null,
      items: [
        DropdownMenuItem(
          child: Text(
            SearchCategory.popular,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.popular,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.upcoming,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.upcoming,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.none,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.none,
        )
      ],
    );
  }

  Widget _moviesListViewWidget() {
    final List<Movie> _movies = [];

    for (var i = 0; i < 20; i++) {
      _movies.add(Movie(
          name: "The Suicide Squad",
          language: "en",
          isAdult: false,
          description:
              "Supervillains Harley Quinn, Bloodsport, Peacemaker and a collection of nutty cons at Belle Reve prison join the super-secret, super-shady Task Force X as they are dropped off at the remote, enemy-infused island of Corto Maltese.",
          posterPath: "/iCi4c4FvVdbaU1t8poH1gvzT6xM.jpg",
          rating: 8.1,
          backdropPath: "/7WJjFviFBffEJvkAms4uWwbcVUk.jpg",
          releaseDate: "2021-08-19"));
    }

    if (_movies.length > 0) {
      return ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (BuildContext _context, int _count) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: deviceHeight! * 0.01, horizontal: 0),
              child: GestureDetector(
                onTap: () {},
                child: MovieTile(
                  height: deviceHeight! * 0.2,
                  width: deviceWidth! * 0.85,
                  movie: _movies[_count],
                ),
              ),
            );
          });
    } else {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }

    // return Container();
  }
}
