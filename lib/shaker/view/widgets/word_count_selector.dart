import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_shaker/shaker/cubit/shaker_cubit.dart';
import 'package:words_shaker/shaker/cubit/shaker_state.dart';

class WordCountSelector extends StatelessWidget {
  const WordCountSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShakerCubit, ShakerState>(
      builder:
          (context, state) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: SegmentedButton<WordCount>(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                segments: const <ButtonSegment<WordCount>>[
                  ButtonSegment<WordCount>(
                    value: WordCount.twelve,
                    label: Text('12'),
                  ),
                  ButtonSegment<WordCount>(
                    value: WordCount.eighteen,
                    label: Text('18'),
                  ),
                  ButtonSegment<WordCount>(
                    value: WordCount.twentyFour,
                    label: Text('24'),
                  ),
                ],
                selected: {state.wordCount},
                onSelectionChanged: (Set<WordCount> newSelection) {
                  context.read<ShakerCubit>().switchType(newSelection.first);
                },
              ),
            ),
          ),
    );
  }
}
