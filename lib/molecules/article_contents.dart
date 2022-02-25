import 'package:testapp0225/atoms/article_day_text.dart';
import 'package:testapp0225/atoms/article_week_text.dart';
import 'package:flutter/material.dart';

class ArticleDay extends StatelessWidget {
  const ArticleDay({Key? key, this.day, this.week}) : super(key: key);
  final String? day;
  final String? week;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ArticleDayText(day: day!),
      ArticleWeekText(week: week!)
    ]);
  }
}
