import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkrater/model.dart';
import 'package:talkrater/talkcard.dart';

void main() => runApp(
  ChangeNotifierProvider.value(
    value: new TalkListModel(),
    child: MyApp(),
));

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
  void initState() {
    Provider.of<TalkListModel>(context, listen: false).fetchTalkList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        )
      ),
      body:
        Consumer<TalkListModel>(
          builder: (context, model, widget) {
            return ListView.builder(
              itemCount: model.items.length,
              itemBuilder: (context, it) {
                return TalkCard(
                    talkId: model.items[it].talkId,
                    location: model.items[it].location,
                    presenter: model.items[it].presenter,
                    tags: model.items[it].tags,
                    talkAbstract: model.items[it].talkAbstract,
                    talkTime: model.items[it].talkTime,
                    title: model.items[it].title,
                  );
              }
            );
          }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
              Provider.of<TalkListModel>(context, listen: false).fetchTalkList();
          },
          child: Icon(Icons.refresh),
        ),
    );
  }
}
