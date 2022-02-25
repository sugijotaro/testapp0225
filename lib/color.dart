import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp0225/color_bl.dart';
import 'package:testapp0225/main.dart';
import "dart:async";

String? color_code;

class MyColorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'color change bloc Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyColorHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyColorHomePage extends StatefulWidget {
  MyColorHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyColorHomePageState createState() => _MyColorHomePageState();
}

class _MyColorHomePageState extends State<MyColorHomePage> {
  int _counter = 0;
  var colorCodeStringStream = StreamController<String>();

  var colorStream = StreamController<Color>.broadcast();
  var input = new Input(color_code ?? "ffffff");
  var coodinator = new Coordinator();
  var consumer = new Consumer();

  void _incrementCounter() {
    input;
  }

  @override
  void initState() {
    input.init(colorCodeStringStream);
    coodinator.init(colorCodeStringStream, colorStream);
    consumer.init(colorStream);
    coodinator.coorinate();
    consumer.consume();

    super.initState();
  }

  @override
  void dispose() {
    colorCodeStringStream.close();
    colorStream.close();
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
              stream: colorCodeStringStream.stream,
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