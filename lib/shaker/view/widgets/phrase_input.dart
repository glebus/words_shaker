import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_shaker/shaker/cubit/shaker_cubit.dart';
import 'package:words_shaker/shaker/cubit/shaker_state.dart';
import 'package:words_shaker/shaker/view/widgets/constants.dart';

class PhraseInput extends StatefulWidget {
  const PhraseInput({super.key});

  @override
  State<PhraseInput> createState() => _PhraseInputState();
}

class _PhraseInputState extends State<PhraseInput> {
  final _controller = TextEditingController();
  bool _isObscured = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShakerCubit, ShakerState>(
      listenWhen: (previous, current) => previous.phrase != current.phrase,
      listener: (context, state) {
        if (_controller.text != state.phrase) {
          _controller.text = state.phrase;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ValueListenableBuilder<TextEditingValue>(
          valueListenable: _controller,
          builder: (context, value, child) {
            return TextField(
              controller: _controller,
              obscureText: _isObscured,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: ShakerConstants.borderRadius,
                ),
                hintText: 'Enter phrase to shake words',
                suffixIcon:
                    value.text.isNotEmpty
                        ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                _isObscured
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscured = !_isObscured;
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.refresh),
                              onPressed: () {
                                _controller.clear();
                                context.read<ShakerCubit>().shake('');
                              },
                            ),
                          ],
                        )
                        : const SizedBox.shrink(),
              ),
              onChanged: (value) {
                context.read<ShakerCubit>().shake(value);
              },
            );
          },
        ),
      ),
    );
  }
}
