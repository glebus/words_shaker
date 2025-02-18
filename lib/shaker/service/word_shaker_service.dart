class WordShakerService {
  List<int> shakeNumbers(String phrase, int wordCount) {
    final numbers = [for (var i = 1; i <= wordCount; i++) i];

    if (phrase.isEmpty) {
      return numbers;
    }

    // Convert phrase to list of character codes
    final charCodes = phrase.runes.toList();

    // Generate sequence of indices based on phrase
    final indices = List<int>.generate(wordCount, (index) {
      var value = 0;
      for (var i = 0; i < charCodes.length; i++) {
        value = (value + charCodes[i] * (i + 1) * (index + 1)) % wordCount;
      }
      return value;
    });

    // Create new array based on generated indices
    final result = List<int>.filled(wordCount, 0);
    var available = numbers.toList();

    for (var i = 0; i < wordCount; i++) {
      final position = indices[i] % available.length;
      result[i] = available[position];
      available.removeAt(position);
    }

    return result;
  }
}
