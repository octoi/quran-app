import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/model/suraths.dart';
import 'package:quran/utils/constants.dart';

class LikeButton extends StatefulWidget {
  final Surah surah;

  const LikeButton({Key? key, required this.surah}) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late Surah surah;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    surah = widget.surah;
  }

  @override
  Widget build(BuildContext context) {
    void updateFavorite() {
      bool _isFavorite = !surah.isFavorite;
      setState(() => surah.isFavorite = _isFavorite);
      Provider.of<Suraths>(context, listen: false).updateFavorite(
        surah.id,
        _isFavorite,
      );
    }

    return IconButton(
      color: appGreen,
      iconSize: 30.0,
      icon: Icon(
        surah.isFavorite ? Icons.favorite : Icons.favorite_outline,
      ),
      onPressed: updateFavorite,
    );
  }
}
