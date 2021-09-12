import 'package:flutter/material.dart';
import 'package:quran/utils/constants.dart';
import 'package:quran/widgets/app_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        backgroundColor: appWhite,
        elevation: 0.0,
        title: AppName(),
      ),
    );
  }
}
