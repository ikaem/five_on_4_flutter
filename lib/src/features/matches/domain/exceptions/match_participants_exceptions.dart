class MatchParticipantsException implements Exception {
  const MatchParticipantsException({
    required this.message,
  });

  final String message;

  @override
  String toString() => 'MatchParticipantsException - $message';
}

class MatchParticipantsPlayerAlreadyJoinedException
    extends MatchParticipantsException {
  const MatchParticipantsPlayerAlreadyJoinedException({
    required super.message,
  });

  @override
  String toString() =>
      'MatchParticipantsPlayerAlreadyJoinedException - $message';
}

class MatchParticipantsPlayerAlreadyUnjoinedException
    extends MatchParticipantsException {
  const MatchParticipantsPlayerAlreadyUnjoinedException({
    required super.message,
  });

  @override
  String toString() =>
      'MatchParticipantsPlayerAlreadyUnjoinedException - $message';
}
