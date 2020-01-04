import 'dart:io';
import 'dart:convert' as convert;
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

  test('Parse talks from JSON to model', () {
    
    File sampleFile = new File('test/sample.json');
    var jsonString = sampleFile.readAsStringSync();
    Map<String, dynamic> sample = convert.jsonDecode(jsonString);
    
    List talksJson = sample['talks'];
    List<Talk> talks = talksJson.map((talk) => Talk.fromJson(talk)).toList();

    expect(talks.length,           equals(3));
    expect(talks[0].presenter,     equals("Barbara L"));
    expect(talks[0].title,         equals("Amazing talk"));
    expect(talks[0].talkAbstract,  equals("Amazing talk abstract"));
    expect(talks[0].location,      equals("Room1"));
    expect(talks[0].tags,          equals(["mobile","tech", "beginner"]));
    expect(talks[0].talkTime,      equals(DateTime.utc(2020, 02, 21, 02, 30)));
  });
}