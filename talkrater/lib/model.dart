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