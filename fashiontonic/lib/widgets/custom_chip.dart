import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.selected,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 32,
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              selected ? Colors.black : Colors.white,
            ),
            foregroundColor: MaterialStateProperty.all(
              selected ? Colors.white : Colors.black,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
