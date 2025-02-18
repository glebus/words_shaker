import 'package:flutter/material.dart';
import 'package:words_shaker/shaker/view/widgets/constants.dart';

class WordCell extends StatelessWidget {
  const WordCell({required this.number, super.key});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: ShakerConstants.borderRadius,
      ),
      child: Center(
        child: Text('$number', style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
