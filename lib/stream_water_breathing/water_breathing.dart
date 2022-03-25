import 'package:flutter/material.dart';
import 'package:testapp0225/stream_water_breathing/water_breathing_logic.dart';
import "dart:async";
import 'package:testapp0225/main.dart';

int version = 0;

void main() {
  runApp(WaterBreathingApp());
}

class WaterBreathingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '水の呼吸'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  var intStream = StreamController<int>();

  var mapStream = StreamController<Map>.broadcast();
  var receiver = new Receiver();
  var coodinator = new Coordinator();
  var consumer = new Consumer();

  void _incrementCounter() {
    receiver.receive(version);
    setState(() {
      // _counter++;
    });
  }

  @override
  void initState() {
    receiver.init(intStream);
    coodinator.init(intStream, mapStream);
    consumer.init(mapStream);
    coodinator.coorinate();
    consumer.consume();

    super.initState();
  }

  @override
  void dispose() {
    intStream.close();
    mapStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: '数字を入力',
              ),
              onChanged: (text) {
                version = int.parse(text);
              },
            ),
            RaisedButton(
              child: Text('決定'),
              onPressed: () {
                receiver.receive(version);
              },
            ),
            StreamBuilder<Map>(
              stream: mapStream.stream,
              initialData: {'number':'0','title':'','caption':''},
              builder: (context, snapshot) {
                return Text(
                  'Code Name : ${snapshot.data!['number']}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4,
                );
              },
            ),
            RaisedButton(
              child: Text('戻る'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      // key: Key('increment'),
      // onPressed: _incrementCounter,
      // tooltip: 'Increment',
      // child: Icon(Icons.
      // add
      // )
      // ,
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
