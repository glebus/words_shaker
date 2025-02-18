import 'package:flutter_test/flutter_test.dart';
import 'package:words_shaker/shaker/service/word_shaker_service.dart';

void main() {
  late WordShakerService service;

  setUp(() {
    service = WordShakerService();
  });

  group('WordShakerService', () {
    test('returns sequential numbers when phrase is empty', () {
      expect(service.shakeNumbers('', 12), [
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
      ]);
    });

    test('returns same result for same input', () {
      final result1 = service.shakeNumbers('test phrase', 12);
      final result2 = service.shakeNumbers('test phrase', 12);
      expect(result1, result2);
    });

    test('returns different results for different phrases', () {
      final result1 = service.shakeNumbers('phrase1', 12);
      final result2 = service.shakeNumbers('phrase2', 12);
      expect(result1, isNot(equals(result2)));
    });

    test('returns all numbers from 1 to wordCount', () {
      final result = service.shakeNumbers('test', 12);
      expect(result, containsAll([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]));
      expect(result.length, 12);
    });

    test('handles different word counts', () {
      expect(service.shakeNumbers('test', 18).length, 18);
      expect(service.shakeNumbers('test', 24).length, 24);
    });

    test('considers character positions in phrase', () {
      final result1 = service.shakeNumbers('abc', 12);
      final result2 = service.shakeNumbers('cba', 12);
      expect(result1, isNot(equals(result2)));
    });

    group('produces exact results', () {
      test('for "test" with 12 words', () {
        expect(service.shakeNumbers('test', 12), [
          12,
          11,
          10,
          9,
          8,
          7,
          6,
          5,
          4,
          3,
          2,
          1,
        ]);
      });

      test('for "hello" with 12 words', () {
        expect(service.shakeNumbers('hello', 12), [
          10,
          7,
          4,
          1,
          3,
          12,
          8,
          2,
          6,
          5,
          11,
          9,
        ]);
      });

      test('for "test" with 18 words', () {
        expect(service.shakeNumbers('test', 18), [
          12,
          5,
          18,
          10,
          2,
          17,
          8,
          9,
          16,
          4,
          13,
          15,
          14,
          1,
          11,
          7,
          6,
          3,
        ]);
      });

      test('for "test" with 24 words', () {
        expect(service.shakeNumbers('test', 24), [
          24,
          23,
          22,
          21,
          20,
          19,
          18,
          17,
          16,
          15,
          14,
          13,
          12,
          11,
          10,
          9,
          8,
          7,
          6,
          5,
          4,
          3,
          2,
          1,
        ]);
      });
    });
  });
}
