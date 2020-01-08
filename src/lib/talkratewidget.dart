import 'package:flutter/material.dart';

class StarTalkRateWidget extends StatelessWidget{

  final int _maxStars;
  final String _talkId;

  const StarTalkRateWidget({Key key, @required String talkId, int maxStars = 5}):
    _maxStars = maxStars,
    _talkId = talkId,
    super(key:key);

  _rateTalk(int starRating){
    print("You rated talk $_talkId with $starRating stars");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text("Rate:"),
        Row(children: List.generate(_maxStars, (it) {
          return IconButton(
            padding: const EdgeInsets.all(4),
            icon: Icon(Icons.star_border),
            onPressed: () => _rateTalk(it),
          );
        }))
      ]
    );
  }
}