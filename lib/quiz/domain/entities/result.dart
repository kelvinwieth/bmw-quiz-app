import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final double _percentage;
  final String _message;

  const Result({required double percentage, required String message})
      : _percentage = percentage,
        _message = message;

  double get percentage => _percentage;

  String get message => _message;

  @override
  List<Object?> get props => [_percentage, _message];
}
