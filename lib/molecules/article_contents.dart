import 'package:testapp0225/atoms/article_title_text.dart';
import 'package:testapp0225/atoms/article_icon_with_text.dart';
import 'package:testapp0225/atoms/article_icons.dart';
import 'package:flutter/material.dart';

class ArticleContents extends StatelessWidget {
  const ArticleContents(
      {Key? key,
      this.title,
      this.time_start,
      this.time_end,
      this.location,
      this.number_of_participants})
      : super(key: key);
  final String? title;
  final String? time_start;
  final String? time_end;
  final String? location;
  final int? number_of_participants;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ArticleTitleText(title: title!),
      SizedBox(height: 8),
      ArticleIconWithText(
          icon: Icons.schedule_rounded, text: "${time_start!} - ${time_end!}"),
      SizedBox(height: 4),
      ArticleIconWithText(icon: Icons.pin_drop_rounded, text: location),
      SizedBox(height: 8),
      ArticleIcons(number_of_participants: number_of_participants!),
      SizedBox(height: 4),
      Divider(color: Colors.grey),
    ]);
  }
}
