import 'package:testapp0225/templates/index_template.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    final data = getData();

    return Scaffold(
        body: Container(
      width: double.infinity,
      child: IndexTemplate(
        data: data,
      ),
    ));
  }

  Map getData() {
    // ToDo: DBから値を取ってくる想定
    return {
      'title': 'イベントリスト atomic',
      // 'header': {
      //   'title': 'Atomic Design',
      //   'imagePath': 'assets/nekohack_logo.png',
      // },
      'body': {
        'articles': [
          {
            'day': 4,
            'week': '土',
            'title': '18:00〜21:00,和光市総合体育館,参加費：700円,締切11/26',
            'time_start': "18:00",
            'time_end': "21:00",
            'location': "参加上限：Re'F S+10人+ゲスト2名",
            'number_of_participants': 4
          },
          {
            "day": 5,
            "week": "日",
            "title": "13:00〜17:00,上村記念加賀スポセン,参加者：700円,締切済",
            "time_start": "13:00",
            "time_end": "17:00",
            "location": "締切済：Re'F F + 10名+ゲスト2",
            "number_of_participants": 11
          },
          {
            "day": 8,
            "week": "水",
            "title": "18:00〜21:00,赤塚体育館,参加者：500円,締切11/30",
            "time_start": "18:00",
            "time_end": "21:00",
            "location": "参加可能人数：16人+ゲスト2名",
            "number_of_participants": 7
          },
        ],
        // 'info': {'userName': 'jiyuujin', 'archives': []}
      },
      // 'footer': {
      //   'title': 'Atomic Design',
      //   'userName': 'jiyuujin',
      // }
    };
  }
}
