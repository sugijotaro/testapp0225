import "dart:math" as math;
import "dart:async";

Map<double, String> list = {
  10.0 : "Cheetah",
  10.1 : "Puma",
  10.2 : "Jaguar",
  10.3 : "Panther",
  10.4 : "Tiger",
  10.5 : "Leopard",
  10.6 : "Snow Leopard",
  10.7 : "Lion",
  10.8 : "Mountain Lion",
  10.9 : "Mavericks",
  10.10 : "Yosemite",
  10.11 : "El Capitan",
  10.12 : "Sierra",
  10.13 : "High Sierra",
  10.14 : "Mojave",
  10.15 : "Catalina",
  11.0 : "Big Sur",
  12.0 : "Monterey"
};

class Receiver {
  var rand;
  var doubleStream;

  init(StreamController<double> stream) {
    rand = new math.Random();
    doubleStream = stream;
  }

  // ランダムな整数を作る
  receive(double data) {
    print("receiverが$dataを受け取ったよ");
    doubleStream.sink.add(data);
  }
}

class Coordinator {
  var doubleStream;
  var strStream;

  init(StreamController<double> doubleStream,
      StreamController<String> strStream) {
    this.doubleStream = doubleStream;
    this.strStream = strStream;
  }

  // 流れてきたものをdoubleからStringにする
  coorinate() {
    doubleStream.stream.listen((data) async {
      // String newData = list[list.indexOf(data)][1];
      String newData = list[data] ?? "そんなバージョンはない";
      print("coordinatorが$dataから$newDataに変換したよ");
      strStream.sink.add(newData);
    });
  }
}

class Consumer {
  var strStream;

  init(StreamController<String> stream) {
    strStream = stream;
  }

  // 流れてきたStringを表示する
  consume() {
    strStream.stream.listen((data) async {
      print("consumerが$dataを使ったよ");
    });
  }
}
