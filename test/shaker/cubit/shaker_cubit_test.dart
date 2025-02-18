import 'package:flutter_test/flutter_test.dart';
import 'package:words_shaker/shaker/cubit/shaker_cubit.dart';
import 'package:words_shaker/shaker/cubit/shaker_state.dart';
import 'package:words_shaker/shaker/service/word_shaker_service.dart';

void main() {
  late ShakerCubit cubit;

  setUp(() {
    cubit = ShakerCubit(shakerService: WordShakerService());
  });

  tearDown(() {
    cubit.close();
  });

  group('ShakerCubit', () {
    test('initial state is correct', () {
      expect(cubit.state.wordCount, WordCount.twelve);
      expect(cubit.state.phrase, isEmpty);
      expect(cubit.state.words.length, 12);
    });

    group('switchType', () {
      test('emits empty state when phrase is empty', () {
        cubit.switchType(WordCount.eighteen);
        expect(cubit.state.wordCount, WordCount.eighteen);
        expect(cubit.state.phrase, isEmpty);
        expect(cubit.state.words.length, 18);
      });

      test('reshuffles with current phrase when switching type', () {
        // First shake with initial phrase
        cubit.shake('test');
        final twelveWords = cubit.state.words;

        // Switch to 18 words
        cubit.switchType(WordCount.eighteen);

        expect(cubit.state.wordCount, WordCount.eighteen);
        expect(cubit.state.phrase, 'test');
        expect(cubit.state.words.length, 18);
        // Should have different order than initial shake
        expect(cubit.state.words.take(12), isNot(equals(twelveWords)));
      });
    });

    group('shake', () {
      test('emits empty state when phrase is empty', () {
        cubit.shake('test');
        cubit.shake('');

        expect(cubit.state.phrase, isEmpty);
        expect(cubit.state.words, List.generate(12, (i) => i + 1));
      });

      test('shuffles numbers when phrase is not empty', () {
        final initialWords = cubit.state.words;
        cubit.shake('test');

        expect(cubit.state.words, isNot(equals(initialWords)));
        expect(cubit.state.phrase, 'test');
        expect(cubit.state.words, containsAll(List.generate(12, (i) => i + 1)));
      });

      test('produces same shuffle for same phrase', () {
        cubit.shake('test');
        final firstShuffle = cubit.state.words;

        cubit.shake('different');
        cubit.shake('test');
        expect(cubit.state.words, equals(firstShuffle));
      });
    });
  });
}
