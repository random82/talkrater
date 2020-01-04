import 'dart:collection';

import 'package:flutter/material.dart';

class Talk {
  final String title;
  final String talkAbstract;
  final String presenter;
  final String location;
  final DateTime talkTime;
  final List<String> tags;

  const Talk({
    @required this.title, 
    @required this.talkAbstract, 
    @required this.presenter, 
    @required this.talkTime, 
    @required this.location,
    @required this.tags});
}

class TalkListModel extends ChangeNotifier {

  final List<Talk> _items = [
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

  UnmodifiableListView<Talk> get items => UnmodifiableListView(_items);

  add(Talk talk){
    _items.add(talk);
    notifyListeners();
  }
}