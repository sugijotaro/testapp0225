import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var events = [
  Event(
      day: 4,
      week: "土",
      title: "18:00〜21:00,和光市総合体育館,参加費：700円,締切11/26",
      time_start: "18:00",
      time_end: "21:00",
      location: "参加上限：Re'F S+10人+ゲスト2名",
      number_of_participants: 4),
  Event(
      day: 5,
      week: "日",
      title: "13:00〜17:00,上村記念加賀スポセン,参加者：700円,締切済",
      time_start: "13:00",
      time_end: "17:00",
      location: "締切済：Re'F F + 10名+ゲスト2",
      number_of_participants: 11),
  Event(
      day: 8,
      week: "水",
      title: "18:00〜21:00,赤塚体育館,参加者：500円,締切11/30",
      time_start: "18:00",
      time_end: "21:00",
      location: "参加可能人数：16人+ゲスト2名",
      number_of_participants: 7),
];

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("イベントリスト"),
        ),
        body: Container(
            width: double.infinity,
            child: ListView.builder(
                itemCount: events == null ? 0 : events.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Column(children: [
                                Text(
                                  events[index].day.toString(),
                                  style: TextStyle(fontSize: 28),
                                ),
                                Text(
                                  events[index].week!,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                )
                              ])),
                          SizedBox(width: 8),
                          Expanded(
                              flex: 5,
                              child: Container(
                                  child: Column(children: [
                                Text(
                                  events[index].title!,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.schedule_rounded,
                                        size: 12, color: Colors.grey),
                                    SizedBox(width: 4),
                                    Text(
                                        "${events[index].time_start!} - ${events[index].time_end!}",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey))
                                  ],
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.pin_drop_rounded,
                                        size: 12, color: Colors.grey),
                                    SizedBox(width: 4),
                                    Text(events[index].location!,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey))
                                  ],
                                ),
                                SizedBox(height: 8),
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        for (var i = 1;
                                            i <=
                                                    events[index]
                                                        .number_of_participants! &&
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
                                            "+${events[index].number_of_participants! - 5}",
                                            style:
                                                TextStyle(color: Colors.grey))
                                      ]),
                                ),
                                // SizedBox(height: 4),
                                Divider(color: Colors.grey)
                              ])))
                        ]),
                  );
                })));
  }
}

class Event {
  Event(
      {this.day,
      this.week,
      this.title,
      this.time_start,
      this.time_end,
      this.location,
      this.number_of_participants});

  int? day;
  String? week;
  String? title;
  String? time_start;
  String? time_end;
  String? location;
  int? number_of_participants;
}
