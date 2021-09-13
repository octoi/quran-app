import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran/model/suraths.dart';
import 'package:quran/utils/constants.dart';

enum Tags { all, makkah, madinah, favorite, unfavorite }

class TagsSearch extends StatefulWidget {
  const TagsSearch({Key? key}) : super(key: key);

  @override
  _TagsSearchState createState() => _TagsSearchState();
}

class _TagsSearchState extends State<TagsSearch> {
  Tags _selectedTag = Tags.all;

  @override
  Widget build(BuildContext context) {
    void _changeTag(Tags tag, String searchTag) {
      setState(() => _selectedTag = tag);
      Provider.of<Suraths>(context, listen: false).search(searchTag);
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: [
          Tag(
            title: 'All',
            isSelected: _selectedTag == Tags.all,
            onTap: () =>
                _changeTag(Tags.all, ''), // search tag '' which means all tags
          ),
          Tag(
            title: 'makkah',
            isSelected: _selectedTag == Tags.makkah,
            onTap: () => _changeTag(Tags.makkah, 'makkah'),
          ),
          Tag(
            title: 'madinah',
            isSelected: _selectedTag == Tags.madinah,
            onTap: () => _changeTag(Tags.madinah, 'madinah'),
          ),
          Tag(
            title: 'favorite',
            isSelected: _selectedTag == Tags.favorite,
            onTap: () => _changeTag(Tags.favorite, 'favorite'),
          ),
          Tag(
            title: 'unfavorite',
            isSelected: _selectedTag == Tags.unfavorite,
            onTap: () => _changeTag(Tags.unfavorite, 'unfavorite'),
          ),
        ],
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onTap;

  const Tag({
    Key? key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: () => onTap(),
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? appGreen : null,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              width: 1,
              color: appGreen,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 23.0,
          ),
          child: Text(
            title,
            style: GoogleFonts.nunito(
              color: isSelected ? appWhite : appGreen,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
