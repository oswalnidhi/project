import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  late bool swap;
  late Color color1,color2;
  final Random random = Random();
  @override
  void initState() {
    swap = false;
    color1 = Color.fromARGB(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256)
    );
    color2=Color.fromARGB(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256)
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget swapWidget;
    if (swap) {
      swapWidget = Row(
        children: [
          Container(
            width: 200,
            height: 200,
            color: color2,
          ),
          Container(
            width: 200,
            height: 200,
            color: color1,
          ),
        ],
      );
    } else {
      swapWidget = Row(
        children: [
          Container(
            width: 200,
            height: 200,
            color: color1,
          ),
          Container(
            width: 200,
            height: 200,
            color: color2,
          ),
        ],
      );
    }
    var swapTile = swapWidget;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              Row(
                children: [
                  swapTile,
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.sync_alt_rounded),
          onPressed: () {
            setState(() {
              swap = !swap;
            });
          }
      ),
    );
  }
}