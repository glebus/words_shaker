import 'package:equatable/equatable.dart';

enum WordCount {
  twelve(12),
  eighteen(18),
  twentyFour(24);

  const WordCount(this.value);
  final int value;
}

class ShakerState extends Equatable {
  final List<int> words;
  final WordCount wordCount;
  final String phrase;

  const ShakerState({
    required this.words,
    required this.wordCount,
    required this.phrase,
  });

  @override
  List<Object?> get props => [words, wordCount, phrase];

  ShakerState copyWith({
    List<int>? words,
    WordCount? wordCount,
    String? phrase,
  }) {
    return ShakerState(
      words: words ?? this.words,
      wordCount: wordCount ?? this.wordCount,
      phrase: phrase ?? this.phrase,
    );
  }

  factory ShakerState.empty(WordCount count) => ShakerState(
    words: [for (var i = 1; i <= count.value; i++) i],
    wordCount: count,
    phrase: "",
  );
}
