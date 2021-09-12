import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/utils/constants.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _searchInputValue = '';
    double _borderRadius = 12.0;

    return Material(
      shadowColor: Colors.white,
      elevation: 1,
      borderRadius: BorderRadius.circular(_borderRadius),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Search ...',
          hintStyle: TextStyle(
            color: appGray,
          ),
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: appGray,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
        ),
        cursorColor: appDark,
        onChanged: (newVal) {
          _searchInputValue = newVal;
        },
      ),
    );
  }
}
