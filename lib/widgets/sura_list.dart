import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/api/api.dart';
import 'package:quran/utils/colors.dart';

class SuraList extends StatefulWidget {
  const SuraList({Key? key}) : super(key: key);

  @override
  _SuraListState createState() => _SuraListState();
}

class _SuraListState extends State<SuraList> {
  @override
  void initState() {
    super.initState();
    getAllChapters();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
        SuraCard(
          title: 'Al-Fatihah',
          page: '1',
          verses: 7,
        ),
      ],
    );
  }
}

class SuraCard extends StatefulWidget {
  final String title;
  final String page;
  final int verses;

  const SuraCard({
    Key? key,
    required this.title,
    required this.page,
    required this.verses,
  }) : super(key: key);

  @override
  _SuraCardState createState() => _SuraCardState();
}

class _SuraCardState extends State<SuraCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.5,
      borderRadius: BorderRadius.circular(10.0),
      child: GestureDetector(
        onTap: () {
          print(widget.title);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.nunito(
                      color: appSecondaryColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'page: ${widget.page}, verses: ${widget.verses}',
                    style: GoogleFonts.nunito(
                      color: appTextColor,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
              IconButton(
                color: appAccentColor,
                iconSize: 30.0,
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_outline,
                ),
                onPressed: () {
                  setState(() => isFavorite = !isFavorite);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
