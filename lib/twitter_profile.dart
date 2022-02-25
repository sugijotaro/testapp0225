import 'package:flutter/material.dart';

var userName = "わくわくさん";
var userId = "sugijotaro";
var description =
    "#SFC22 大学垢→@sugijotaro_ 高校3年生の18歳 / 興味：アプリ開発、ゲーム開発、AR、観光、触感、VR、フォトグラメトリ、🐈、フォント / SwiftStudentChallenge2020 winner @nhk_hamatta の #スマホアプリ沼 回に出ました📱 🍜🐸🐨";
var location = "わくわく🤩";
var url = "www.sugijotaro.com";
// var birthDay =
// var startDay =
var follow = 2023;
var follower = 877;

class TwitterProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            child: ListView(children: <Widget>[
              Container(
                child: Image.network(
                    "https://pbs.twimg.com/profile_banners/1180741228532359170/1628088812/1500x500"),
              ),
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.topLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundImage: NetworkImage(
                                'https://abs.twimg.com/sticky/default_profile_images/default_profile_400x400.png'),
                          ),
                          RaisedButton(
                            child: Text('編集'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        userName,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        userId,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(height: 12),
                      Text(description),
                      Wrap(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.pin_drop,
                                  size: 14, color: Colors.grey),
                              SizedBox(width: 4),
                              Text(location,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                              SizedBox(width: 8),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.insert_link,
                                  size: 14, color: Colors.grey),
                              SizedBox(width: 4),
                              Text(url,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                              SizedBox(width: 8),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.schedule_rounded,
                                  size: 12, color: Colors.grey),
                              SizedBox(width: 4),
                              Text("誕生日　2003年10月15日",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                              SizedBox(width: 8),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today,
                                  size: 12, color: Colors.grey),
                              SizedBox(width: 4),
                              Text("2019年10月からTwitterを利用しています",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                              SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(follow.toString(),
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(width: 4),
                          Text("フォロー中",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                          SizedBox(width: 8),
                          Text(follower.toString(),
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(width: 4),
                          Text("フォロワー",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey))
                        ],
                      )
                    ]),
              ),
              Container(
                child: RaisedButton(
                  child: Text('戻る'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ])));
  }
}
