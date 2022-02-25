import 'package:testapp0225/molecules/article_day.dart';
import 'package:testapp0225/molecules/article_contents.dart';
import 'package:flutter/material.dart';

class ArticleBodyOrganisms extends StatelessWidget {
  const ArticleBodyOrganisms({Key? key, this.data}) : super(key: key);
  final List? data;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: createArticles(context));
  }

  List<Widget> createArticles(BuildContext context) {
    if (data != null && data!.isNotEmpty) {
      final widgets = <Widget>[];

      for (final element in data!) {
        final String day = element['day'];
        final String week = element['week'];
        final String title = element['title'];
        final String time_start = element['time_start'];
        final String time_end = element['time_end'];
        final String location = element['location'];
        final int number_of_participants = element['number_of_participants'];

        final Widget widget = Container(
          padding: EdgeInsets.all(8),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                flex: 1,
                child: ArticleDay(
                  day: day,
                  week: week,
                )),
            SizedBox(width: 8),
            Expanded(
                flex: 5,
                child: ArticleContents(
                    title: title,
                    time_start: time_start,
                    time_end: time_end,
                    location: location,
                    number_of_participants: number_of_participants))
          ]),
        );

        widgets.add(widget);
      }
      return widgets;
    }
    return [Text("aaaa")];
  }
}
