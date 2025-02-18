import 'package:flutter/material.dart';
import 'package:words_shaker/shaker/view/widgets/word_count_selector.dart';
import 'package:words_shaker/shaker/view/widgets/word_grid.dart';
import 'package:words_shaker/shaker/view/widgets/phrase_input.dart';

class ShakerView extends StatelessWidget {
  const ShakerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            WordCountSelector(),
            SizedBox(height: 10),
            Expanded(child: WordGrid()),
            SizedBox(height: 10),
            PhraseInput(),
          ],
        ),
      ),
    );
  }
}
