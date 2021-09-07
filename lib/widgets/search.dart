import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/utils/colors.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

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
            color: appTextColor,
          ),
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: appTextColor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
        ),
        cursorColor: appSecondaryColor,
        onChanged: (newVal) {
          _searchInputValue = newVal;
        },
      ),
    );
  }
}
