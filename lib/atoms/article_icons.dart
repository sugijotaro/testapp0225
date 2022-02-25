import 'package:flutter/material.dart';

class ArticleIcons extends StatelessWidget {
  const ArticleIcons({Key? key, this.number_of_participants}) : super(key: key);
  final int? number_of_participants;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
          crossAxisAlignment:
          CrossAxisAlignment.end,
          children: [
            for (var i = 1;
            i <=
                number_of_participants! &&
                i <= 5;
            i++)
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                        'https://abs.twimg.com/sticky/default_profile_images/default_profile_400x400.png'),
                  ),
                  SizedBox(width: 4),
                ],
              ),
            Text(
                "+${number_of_participants! - 5}",
                style:
                TextStyle(color: Colors.grey))
          ]),
    );
  }
}
