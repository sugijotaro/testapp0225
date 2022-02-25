import 'package:flutter/material.dart';

class ArticleWeekText extends StatelessWidget {
  const ArticleWeekText({Key? key, this.week}) : super(key: key);
  final String? week;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$week',
      style: TextStyle(fontSize: 12, color: Colors.grey),
    );
  }
}
