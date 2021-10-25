import 'package:equatable/equatable.dart';

class Question extends Equatable {
  String description;
  List<String> options;
  String? _attempt;

  Question({required this.description, required this.options});

  void choseOption(String attempt) {
    if (!options.contains(attempt)) {
      return;
    }

    _attempt = attempt;
  }

  String? get attempt => _attempt;

  bool get isAnswered => _attempt != null;

  bool get isNotAnswered => !isAnswered;

  @override
  List<Object?> get props => [description, options, _attempt];
}
