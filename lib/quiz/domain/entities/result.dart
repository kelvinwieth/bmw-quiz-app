class Result {
  final double _percentage;
  final String _message;

  const Result({required double percentage, required String message})
      : _percentage = percentage,
        _message = message;

  double get percentage => _percentage;

  String get message => _message;
}
