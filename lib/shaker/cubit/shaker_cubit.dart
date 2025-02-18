import 'package:bloc/bloc.dart';
import 'package:words_shaker/shaker/cubit/shaker_state.dart';
import 'package:words_shaker/shaker/service/word_shaker_service.dart';

class ShakerCubit extends Cubit<ShakerState> {
  ShakerCubit({required WordShakerService shakerService})
    : _shakerService = shakerService,
      super(ShakerState.empty(WordCount.twelve));

  final WordShakerService _shakerService;

  void switchType(WordCount wordCount) {
    if (state.phrase.isEmpty) {
      emit(ShakerState.empty(wordCount));
    } else {
      emit(
        ShakerState(
          words: _shakerService.shakeNumbers(state.phrase, wordCount.value),
          wordCount: wordCount,
          phrase: state.phrase,
        ),
      );
    }
  }

  void shake(String phrase) {
    if (phrase.isEmpty) {
      emit(ShakerState.empty(state.wordCount));
    } else {
      emit(
        state.copyWith(
          words: _shakerService.shakeNumbers(phrase, state.wordCount.value),
          phrase: phrase,
        ),
      );
    }
  }
}
