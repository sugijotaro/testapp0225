import 'package:flutter/material.dart';

class ArticleIconWithText extends StatelessWidget {
  const ArticleIconWithText({Key? key, this.icon, this.text}) : super(key: key);
  final IconData? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,
            size: 12, color: Colors.grey),
        SizedBox(width: 4),
        Text(text!,
            style: TextStyle(
                fontSize: 14, color: Colors.grey))
      ],
    );
  }
}
