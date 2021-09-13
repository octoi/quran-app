import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran/model/suraths.dart';
import 'package:quran/utils/constants.dart';

class SurahList extends StatelessWidget {
  const SurahList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<Suraths>(context, listen: false).fetchAndSetSurahs(),
      builder: (context, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: appGreen));
        } else {
          return Consumer<Suraths>(
            builder: (ctx, surathsData, _) {
              return Column(
                children: surathsData.suraths.map((surah) {
                  return SuraCard(surah: surah);
                }).toList(),
              );
            },
          );
        }
      },
    );
  }
}

class SuraCard extends StatefulWidget {
  final Surah surah;

  const SuraCard({Key? key, required this.surah}) : super(key: key);

  @override
  _SuraCardState createState() => _SuraCardState();
}

class _SuraCardState extends State<SuraCard> {
  bool isFavorite = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() => isFavorite = widget.surah.isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.5,
      borderRadius: BorderRadius.circular(10.0),
      child: GestureDetector(
        onTap: () {
          print(widget.surah.surah);
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
                    widget.surah.surah,
                    style: GoogleFonts.nunito(
                      color: appDark,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'page: ${widget.surah.pages}, verses: ${widget.surah.verses}',
                    style: GoogleFonts.nunito(
                      color: appGray,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
              IconButton(
                color: appGreen,
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
