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
        title: 'Amazing talk',
        talkAbstract: 
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ullamcorper pharetra massa. '
                  'Etiam ante sem, posuere ac ante vitae, scelerisque sagittis arcu. Donec tempor ligula quis malesuada accumsan. '
                  'Curabitur pulvinar justo ac lorem semper, id suscipit diam volutpat. Duis egestas ultrices ante viverra facilisis. ',
        presenter: 'Barbara L' ,
        location: 'Room1',
        talkTime: new DateTime(2020, 02, 21, 12, 30),
        tags: ['mobile','tech', 'beginner'],
      ),
      Talk(
        title: 'Another amazing talk',
        talkAbstract: 
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ullamcorper pharetra massa. '
                  'Etiam ante sem, posuere ac ante vitae, scelerisque sagittis arcu. Donec tempor ligula quis malesuada accumsan. '
                  'Curabitur pulvinar justo ac lorem semper, id suscipit diam volutpat. Duis egestas ultrices ante viverra facilisis. ',
        presenter: 'Jane D' ,
        location: 'Room1',
        talkTime: new DateTime(2020, 02, 21, 14, 30),
        tags: ['cloud','expert'],
      ),
      Talk(
        title: 'Yet another amazing talk',
        talkAbstract: 
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ullamcorper pharetra massa. '
                  'Etiam ante sem, posuere ac ante vitae, scelerisque sagittis arcu. Donec tempor ligula quis malesuada accumsan. '
                  'Curabitur pulvinar justo ac lorem semper, id suscipit diam volutpat. Duis egestas ultrices ante viverra facilisis. ',
        presenter: 'Jeannette W' ,
        location: 'Room1',
        talkTime: new DateTime(2020, 02, 21, 15, 30),
        tags: ['AWS','k8s', 'beginner'],
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        )
      ),
      body: ListView.builder(
        itemCount: talks.length,
        itemBuilder: (context, it) {
          return TalkCard(
              location: talks[it].location,
              presenter: talks[it].presenter,
              tags: talks[it].tags,
              talkAbstract: talks[it].talkAbstract,
              talkTime: talks[it].talkTime,
              title: talks[it].title,
            );
          }
        ),
    );
  }
}
