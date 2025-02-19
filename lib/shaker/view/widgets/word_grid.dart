import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_shaker/shaker/cubit/shaker_cubit.dart';
import 'package:words_shaker/shaker/cubit/shaker_state.dart';

class WordGrid extends StatelessWidget {
  const WordGrid({super.key});

  static const _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 8,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    childAspectRatio: 1.2,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<ShakerCubit, ShakerState>(
        builder:
            (context, state) => Center(
              child: SingleChildScrollView(
                child: GridView.builder(
                  key: ValueKey(state.words),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: _gridDelegate,
                  itemCount: state.words.length,
                  itemBuilder:
                      (context, index) => WordCell(number: state.words[index]),
                ),
              ),
            ),
      ),
    );
  }
}

class WordCell extends StatelessWidget {
  const WordCell({required this.number, super.key});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text('$number', style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
