import 'dart:collection';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Talk {
  final String talkId;
  final String title;
  final String talkAbstract;
  final String presenter;
  final String location;
  final DateTime talkTime;
  final List<String> tags;
  final int rating;

  const Talk({
    @required this.talkId,
    @required this.title, 
    @required this.talkAbstract, 
    @required this.presenter, 
    @required this.talkTime, 
    @required this.location,
    @required this.tags,
    this.rating = 0});

  Talk.fromJson(Map<String,dynamic> map):
    talkId = map['talkId'],
    title = map['title'],
    location = map['location'],
    presenter = map['presenter'],
    talkAbstract = map['talkAbstract'],
    talkTime = DateTime.parse(map['talkTime']),
    tags = (map['tags'] as List).cast<String>(),
    rating = 0;

  @override
  bool operator ==(other) => this.talkId == other.talkId;

  @override
  int get hashCode => this.talkId.hashCode;
}

class TalkListModel extends ChangeNotifier {

  final List<Talk> _items = [];

  UnmodifiableListView<Talk> get items => UnmodifiableListView(_items);

  rateTalk(String talkId, int rating){
    var previous = _items.firstWhere((t) => t.talkId == talkId);
    if(previous != null){
      var newTalk = Talk(
        talkId: previous.talkId,
        title: previous.title,
        talkAbstract: previous.talkAbstract,
        talkTime: previous.talkTime,
        location: previous.location,
        presenter: previous.presenter,
        tags: previous.tags.toList(),
        rating: rating
      ); 
      var index = _items.indexOf(previous); 
      _items.replaceRange(index, index + 1, [newTalk]);
      print("You rated talk $talkId with $rating stars");
      notifyListeners();
    }
  }

  add(Talk talk){
    if(!_items.contains(talk)){
      _items.add(talk);
      _items.sort((t1,t2) => t1.talkTime.difference(t2.talkTime).inMilliseconds);
      notifyListeners();
    }
  }

  Future fetchTalkList() async{

    var url = 'https://tr0934ng8530.blob.core.windows.net/b2b/2020Q1.json';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print('Found response for ${jsonResponse['event']}.');

      List talksJson = jsonResponse['talks'];
      talksJson
        .map((talkJson) => Talk.fromJson(talkJson))
        .forEach((talk) => add(talk)); 
      } 
    else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}