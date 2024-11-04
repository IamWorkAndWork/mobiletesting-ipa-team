import 'package:flutter/material.dart';
import 'package:mobiletesting/login_screen/login_view_model.dart';

class Dot extends StatelessWidget {
  final LoginViewModel viewModel;

  const Dot({super.key, required this.viewModel});

  @override
  Widget build(Object context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ...List<int>.generate(6, (i) => i + 1).map<Widget>(
          (index) {
            return createCircle(index, viewModel);
          },
        )
      ]),
    );
  }

  Widget createCircle(int index, LoginViewModel viewModel) {
    final isInput = viewModel.isInput(index);
    if (isInput) {
      final digit = viewModel.getCurrentNumber(index);
      return createFilledCircle(digit);
    } else {
      return Container(
          width: 15.0, height: 15.0, decoration: nonFilledCircle());
    }
  }

  BoxDecoration filledCircle() {
    return const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.orange,
    );
  }

  BoxDecoration nonFilledCircle() {
    return BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.orange,
        width: 2.0,
      ),
    );
  }

  Widget createFilledCircle(String digit) {
    return Container(width: 15.0, height: 15.0, decoration: filledCircle());
  }
}
