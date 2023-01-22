import 'package:flutter/material.dart';

@immutable
class NewMatchValue {
  const NewMatchValue({
    required this.name,
    required this.organizer,
    required this.timeAndDate,
    required this.location,
  });

  // TODO maybe this can do its validation as well? but then we have validation everywhere - we dont want that - lets leave bloc doing it

  final String name;
  // TODO this will be some id or such
  final String organizer;
  final int timeAndDate;
  // TODO maybe better some geo coordinates here
  final String location;
  // TODO AND BUNCH OF other stuff
}
