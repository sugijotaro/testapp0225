import "dart:async";
import 'dart:ui';

class Input {
  var colorCodeStringStream;
  init(StreamController<String> stream) {
    colorCodeStringStream = stream;
  }

  // ランダムな整数を作る
  Input(String color_code) {
    print("色コード：$color_codeを受け取った");
    colorCodeStringStream.sink.add(color_code);
  }
}

class Coordinator {
  var colorCodeStringStream;
  var colorStream;
  init(StreamController<String> colorCodeStringStream,
      StreamController<Color> colorStream) {
    this.colorCodeStringStream = colorCodeStringStream;
    this.colorStream = colorStream;
  }

  // 流れてきたものをStringからColorにする
  coorinate() {
    colorCodeStringStream.stream.listen((data) async {

      // String oldData = data.toUpperCase().replaceAll('#', '');
      // if (oldData.length == 6) {
      //   oldData = 'FF' + oldData;
      // }
      // print(int.parse(oldData, radix: 16));
      // Color newColor = Color(int.parse(oldData, radix: 16));

      // print("色コード：$newColor");
      colorStream.sink.add(Color(478446));
    });
  }
}

class Consumer {
  var colorStream;
  init(StreamController<Color> stream) {
    colorStream = stream;
  }

  // 流れてきたColorを表示する
  consume() {
    colorStream.stream.listen((data) async {
      print("consumer　：　$data");
    });
  }
}