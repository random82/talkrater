import 'package:flutter/material.dart';
import 'package:talkrater/model.dart';
import 'package:talkrater/talkcard.dart';

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
        chipTheme: ChipThemeData.fromDefaults(
          primaryColor: Colors.purpleAccent[700],
          labelStyle: TextStyle(
            fontSize: 12,
          ), 
          secondaryColor: Colors.blueAccent[400],
        )
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
    var talks = <Talk>[
      Talk(
        title: 'Flutter: The good, the bad, and the ugly',
        talkAbstract: 
                  'This is an introduction to mobile development using Flutter and Dart. \n\n'
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ullamcorper pharetra massa. '
                  'Etiam ante sem, posuere ac ante vitae, scelerisque sagittis arcu. Donec tempor ligula quis malesuada accumsan. '
                  'Curabitur pulvinar justo ac lorem semper, id suscipit diam volutpat. Duis egestas ultrices ante viverra facilisis. ',
        presenter: 'Dom Raniszewski' ,
        location: 'Room1',
        talkTime: new DateTime(2020, 02, 21, 12,30), 
        tags: ['mobile','tech', 'beginner'],
      )
    ];

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
          children: talks.map((talk){
            return TalkCard(
              location: talk.location,
              presenter: talk.presenter,
              tags: talk.tags,
              talkAbstract: talk.talkAbstract,
              talkTime: talk.talkTime,
              title: talk.title,
            );
          }).toList()
        ),
      ),
    );
  }
}
