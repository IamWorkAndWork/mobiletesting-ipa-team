import 'package:flutter/material.dart';
import 'package:mobiletesting/login_screen/sort_order.dart';

class PinGridView extends StatelessWidget {
  final SortOrder sortOrder;
  final VoidCallback deleteButtonOnPressed;
  final void Function(int) numberButtonOnPressed;
  const PinGridView(
      {super.key,
      required this.sortOrder,
      required this.deleteButtonOnPressed,
      required this.numberButtonOnPressed});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemCount: 11,
      itemBuilder: (context, index) {
        if (index == 10) {
          // Last item, render delete button
          return IconButton(
              icon: const Icon(Icons.backspace),
              onPressed: deleteButtonOnPressed);
        }
        return InkWell(
          onTap: () {
            numberButtonOnPressed(sortOrder.getDisplayNumber(index));
            //   // print('Pressed ${widget.KeyPadsortOrder.getDisplayNumber(index)}');
          },
          child: Container(
            alignment: Alignment.center,
            child: Text(
              '${sortOrder.getDisplayNumber(index)}',
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
