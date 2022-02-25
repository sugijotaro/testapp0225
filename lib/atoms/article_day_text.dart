import 'package:flutter/material.dart';

class ArticleDayText extends StatelessWidget {
  const ArticleDayText({Key? key, this.day}) : super(key: key);
  final String? day;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$day',
      style: TextStyle(fontSize: 28),
    );
  }
}
