import 'package:flutter/material.dart';

class LeftRightArrowTextField extends StatefulWidget {
  const LeftRightArrowTextField({super.key});

  @override
  State<LeftRightArrowTextField> createState() =>
      _LeftRightArrowTextFieldState();
}

class _LeftRightArrowTextFieldState extends State<LeftRightArrowTextField> {
  final TextEditingController _controller = TextEditingController();
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: () {
            setState(() {
              _counter--;
              _controller.text = _counter.toString();
            });
          },
        ),
        SizedBox(
          width: 50, // Adjust the width as needed
          child: TextField(
            controller: _controller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _counter = int.tryParse(value) ?? 1;
              });
            },
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_right),
          onPressed: () {
            setState(() {
              _counter++;
              _controller.text = _counter.toString();
            });
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
