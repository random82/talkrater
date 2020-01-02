import 'package:flutter/material.dart';

class TalkCard extends StatelessWidget {

  final String title;

  final String talkAbstract;

  final String presenter;

  final DateTime talkTime;

  final String location;

  TalkCard({this.title, this.talkAbstract, this.presenter, this.talkTime, this.location});

  @override
  Widget build(BuildContext context) {
    return new Card(
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
                          child: Image.asset(
                            'images/flutter-logo.png',
                            width: 60,
                            height: 60,
                          )
                        )
                      ]
                    )
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
                                        'Friday, 12:30pm',
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
            );
  }
}