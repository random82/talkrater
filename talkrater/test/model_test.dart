import 'package:flutter_test/flutter_test.dart';
import 'package:talkrater/model.dart';

void main() {

test('adding item increases item count', () {
  final talkList = TalkListModel();
  var initialLength = talkList.items.length;
  talkList.addListener(() {
    expect(talkList.items.length, greaterThan(initialLength));
  });
  talkList.add(Talk(
    title: 'Amazing talk',
    talkAbstract: 
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ullamcorper pharetra massa. '
              'Etiam ante sem, posuere ac ante vitae, scelerisque sagittis arcu. Donec tempor ligula quis malesuada accumsan. '
              'Curabitur pulvinar justo ac lorem semper, id suscipit diam volutpat. Duis egestas ultrices ante viverra facilisis. ',
    presenter: 'Barbara L' ,
    location: 'Room1',
    talkTime: new DateTime(2020, 02, 21, 12, 30),
    tags: ['mobile','tech', 'beginner'],
  ));
});
}