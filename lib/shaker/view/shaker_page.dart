import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_shaker/shaker/service/word_shaker_service.dart';
import 'package:words_shaker/shaker/shaker.dart';

class ShakerPage extends StatelessWidget {
  const ShakerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShakerCubit(shakerService: WordShakerService()),
      child: const ShakerView(),
    );
  }
}
