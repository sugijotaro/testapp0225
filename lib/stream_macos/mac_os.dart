import 'package:flutter/material.dart';
import 'package:testapp0225/stream_macos/mac_os_logic.dart';
import "dart:async";
import 'package:testapp0225/main.dart';

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
  int _counter = 0;
  var intStream = StreamController<int>();

  var stringStream = StreamController<String>.broadcast();
  var generator = new Generator();
  var coodinator = new Coordinator();
  var consumer = new Consumer();

  void _incrementCounter() {
    generator.generate();
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    generator.init(intStream);
    coodinator.init(intStream, stringStream);
    consumer.init(stringStream);
    coodinator.coorinate();
    consumer.consume();

    super.initState();
  }

  @override
  void dispose() {
    intStream.close();
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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              key: Key('counter'),
              style: Theme.of(context).textTheme.headline4,
            ),
            StreamBuilder<String>(
              stream: stringStream.stream,
              initialData: "",
              builder: (context, snapshot) {
                return Text(
                  'RANDOM : ${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
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
      floatingActionButton: FloatingActionButton(
        key: Key('increment'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
