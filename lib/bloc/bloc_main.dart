import 'package:flutter/material.dart';
import 'package:testapp0225/bloc/blocs/calc_provider.dart';
import 'screen.dart';

void main() => runApp(MyBlocApp());

class MyBlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalcBlocProvider(
        child: CalcScreen(),
      ),
    );
  }
}
