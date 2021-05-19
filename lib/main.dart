import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Бася и Жорик',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(swap: false),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final bool swap;

  MyHomePage({Key key, this.swap}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool swap = false;

  @override
  void initState() {
    swap = widget.swap;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var buttonTile = new ListTile(
      title: new RaisedButton(
          child: new Text("Нажми на меня"),
          onPressed: () {
            setState(() {
              swap = !swap;
            });
          }),
    );

    Widget swapWidget;
    if (swap) {
      swapWidget = new CircleAvatar(
        radius: 350,
        backgroundImage: AssetImage('assets/images/Jora.jpg'),
        child: Text("Жорик"),
      );
    } else {
      swapWidget = new CircleAvatar(
        radius: 120,
        backgroundImage: AssetImage('assets/images/Basya.jpg'),
       child: Text("Бася"),


      );
    }
    var swapTile = new ListTile(
      title: swapWidget,
    );

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.brown,
        title: Text("Бася и Жорик)"
        ),
        centerTitle: true,
      ),


      body: new ListView(
        children: <Widget>[
          buttonTile,
          swapTile,
        ],
      ),
    );
  }
}