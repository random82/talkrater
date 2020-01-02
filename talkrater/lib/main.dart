import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Talk rater'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
          child: Text(widget.title),
        )
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child:Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    'Flutter: The good, the bad, and the ugly',
                                    style: TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 20
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(children: <Widget>[
                                    Card(
                                      color: Colors.purpleAccent[400],
                                      child: Padding(
                                          padding: EdgeInsets.all(3),
                                          child: Text(
                                          'mobile',
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                        ),
                                      )
                                    ),
                                    Card(
                                      color: Colors.purpleAccent[400],
                                      child: Padding(
                                          padding: EdgeInsets.all(3),
                                          child: Text(
                                          'tech',
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                        ),
                                      )
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.image)
                        )
                      ]
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                        'This is an introduction to mobile development using Flutter and Dart. \n\n'
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ullamcorper pharetra massa. '
                        'Etiam ante sem, posuere ac ante vitae, scelerisque sagittis arcu. Donec tempor ligula quis malesuada accumsan. '
                        'Curabitur pulvinar justo ac lorem semper, id suscipit diam volutpat. Duis egestas ultrices ante viverra facilisis. ',
                        maxLines: 5,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child:Text('Dom',
                                        style: TextStyle (
                                          fontSize: 20 
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child:Text('Friday, 12:30pm',
                                        style: TextStyle (
                                          fontSize: 20 
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                          )
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.map
                                      ),
                                    ),
                                    Text('Room1',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.watch_later
                                      ),
                                    ),
                                    Text('Starting in 1:47hr',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic
                                      ),
                                    ),
                                  ],
                                )
                              ]
                          )
                        )
                      ],
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20,0,20,20),
                    child: Row(
                      children: <Widget>[
                        Text("Rate:"),
                        Icon(Icons.star_border),
                        Icon(Icons.star_border),
                        Icon(Icons.star_border),
                        Icon(Icons.star_border),
                        Icon(Icons.star_border),
                      ],
                    )
                  ),
                ]
              )
            ),
            Text('Talk 2'),
            Text('Talk 3'),
          ],
        ),
      ),
    );
  }
}
