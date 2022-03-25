import 'dart:ffi';
import "dart:math" as math;
import "dart:async";
import 'package:cloud_firestore/cloud_firestore.dart';

class Receiver {
  var rand;
  var intStream;

  init(StreamController<int> stream) {
    rand = new math.Random();
    intStream = stream;
  }

  receive(int data) {
    print("receiverが$dataを受け取ったよ");
    intStream.sink.add(data);
  }
}

class Coordinator {
  var intStream;
  var mapStream;

  init(StreamController<int> intStream, StreamController<Map> mapStream) {
    this.intStream = intStream;
    this.mapStream = mapStream;
  }

  // 流れてきたものをdoubleからStringにする
  coorinate() {
    intStream.stream.listen((data) async {
      // // String newData = list[list.indexOf(data)][1];
      // String newData = list[data] ?? "そんなバージョンはない";

      // var firestoreData =

      final message = FirebaseFirestore.instance.collection("events").doc('1').get();

      print("coordinatorが$dataから${message.toString()}に変換したよ");
      mapStream.sink.add(message);
    });
  }
}

class Consumer {
  var mapStream;

  init(StreamController<Map> stream) {
    mapStream = stream;
  }

  // 流れてきたStringを表示する
  consume() {
    mapStream.stream.listen((data) async {
      print("consumerが$dataを使ったよ");
    });
  }
}
