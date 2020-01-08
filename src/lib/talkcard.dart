import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talkrater/talkratewidget.dart';

class TalkCardDetailsSection extends StatelessWidget {

  final String presenter;

  final String location;

  final String formattedTalkTime; 

  final String formattedStartingIn;

  static String _formatDuration(Duration duration) {
    if(duration < Duration.zero) {
      return 'Started already';
    }

    if(duration.inDays > 0){
      return 'Starting in ${duration.inDays} days';
    }

    return 'Starting in ${duration.inHours}:${duration.inMinutes}';
  }

  TalkCardDetailsSection({Key key, 
    @required this.presenter, 
    @required talkTime, 
    @required this.location}):
      formattedTalkTime = DateFormat.EEEE().add_jm().format(talkTime),
      formattedStartingIn = _formatDuration(talkTime.difference(DateTime.now())),
      super(key:key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                      child:Text(
                        this.presenter,
                        style: TextStyle (
                          fontSize: 20 
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child:Text(
                        this.formattedTalkTime,
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
                    Text(
                      this.location,
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
                    Text(
                      this.formattedStartingIn,
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
    );
  }
}

class TalkCardTitleSection extends StatelessWidget {

  final String title;

  final List<String> tags;

  const TalkCardTitleSection({Key key, @required this.title, @required this.tags}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    this.title,
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 20
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: tags.take(3).map<Widget>((it) {
                      return Chip(
                        label :  Text(it),
                      );
                    }).toList()
                ),
              )
            ],
          )
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            'images/flutter-logo.png',
            width: 60,
            height: 60,
          )
        )
      ]
    );
  }
}

class TalkCard extends StatelessWidget {

  final String talkId;

  final String title;

  final String talkAbstract;

  final String presenter;

  final DateTime talkTime;

  final String location;

  final List<String> tags;

  final int rating;

  const TalkCard({Key key, 
    @required this.talkId,
    @required this.title, 
    @required this.talkAbstract, 
    @required this.presenter, 
    @required this.talkTime, 
    @required this.location,
    @required this.tags,
    this.rating = 0
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TalkCardTitleSection(title: this.title, tags: this.tags)
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
                this.talkAbstract,
                maxLines: 5,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TalkCardDetailsSection(
              location: this.location,
              presenter: this.presenter,
              talkTime: this.talkTime,
            )
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20,0,20,20),
            child: StarTalkRateWidget(talkId: talkId, currentRating: rating)
          )
        ]
      )
    );
  }
}
