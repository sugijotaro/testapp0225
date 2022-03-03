import 'package:flutter/material.dart';
import 'package:testapp0225/stream_macos/mac_os_logic.dart';
import "dart:async";
import 'package:testapp0225/main.dart';

double version = 0.0;

void main() {
  runApp(MacOSApp());
}

class MacOSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Mac OS Code Name'),
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
  var doubleStream = StreamController<double>();

  var stringStream = StreamController<String>.broadcast();
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
    receiver.init(doubleStream);
    coodinator.init(doubleStream, stringStream);
    consumer.init(stringStream);
    coodinator.coorinate();
    consumer.consume();

    super.initState();
  }

  @override
  void dispose() {
    doubleStream.close();
    stringStream.close();
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
          hintText: 'macOS（Mac OS X）バージョンを入力',
        ),
        onChanged: (text) {
          version = double.parse(text);
        },
      ),
            RaisedButton(
              child: Text('決定'),
              onPressed: () {
                receiver.receive(version);
              },
            ),
      StreamBuilder<String>(
        stream: stringStream.stream,
        initialData: "",
        builder: (context, snapshot) {
          return Text(
            'Code Name : ${snapshot.data}',
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
