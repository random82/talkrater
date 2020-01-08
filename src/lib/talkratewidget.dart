import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class StarTalkRateWidget extends StatelessWidget{

  final int _maxStars;
  final String _talkId;
  final int _currentRating;

  const StarTalkRateWidget({Key key, @required String talkId, int currentRating = 0, int maxStars = 5}):
    _maxStars = maxStars,
    _talkId = talkId,
    _currentRating = currentRating,
    super(key:key);

  _rateTalk(BuildContext context, int starRating){
    starRating++;
    Provider.of<TalkListModel>(context, listen: false).rateTalk(this._talkId, starRating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text("Rate:"),
        Row(children: List.generate(_currentRating, (it) {
            return IconButton(
              padding: const EdgeInsets.all(4),
              icon: Icon(Icons.star),
              onPressed: () =>  _rateTalk(context, it),
            );
          })
          .followedBy(List.generate(_maxStars - _currentRating, (it) {
            return IconButton(
              padding: const EdgeInsets.all(4),
              icon: Icon(Icons.star_border),
              onPressed: () => _rateTalk(context, it + _currentRating)
            );
          })).toList())
      ]
    );
  }
}